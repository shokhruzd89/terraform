resource "aws_db_instance" "ziyotek_devops_dbase" {
  allocated_storage      = var.dbase_storage 
  engine                 = "postgres"
  engine_version         = var.dbase_version
  instance_class         = "db.t2.micro"
  name                   = "${var.environment}-${var.dbase_name}"
  username               = var.dbase_username 
  password               = aws_ssm_parameter.ziyo_ssm.value
  skip_final_snapshot    = true
  db_subnet_group_name   = aws_db_subnet_group.ziyotek_db_sg.id
  vpc_security_group_ids = var.vpc_security_group
}

resource "aws_db_subnet_group" "ziyotek_db_sg" {
  name       = "${var.environment}-ziyotek"
  subnet_ids = var.subnet_ids
}

resource "random_password" "password" {
  length           = 20
  special          = true
  override_special = "_%@"
}

resource "aws_ssm_parameter" "ziyo_ssm" {
  name  = "/ziyotek/devops/${var.environment}/db_password"
  type  = "SecureString"
  key_id = aws_kms_key.db_key.key_id
  value = random_password.password.result
}

resource "aws_kms_key" "db_key" {
  description             = "${var.environment} key for db encryption1"
  deletion_window_in_days = 7
}

