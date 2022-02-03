resource "aws_db_instance" "ziyotek_devops_db" {
  allocated_storage      = var.db_storage 
  engine                 = "postgres"
  engine_version         = var.db_version
  instance_class         = "db.t2.micro"
  name                   = var.db_name 
  username               = var.db_username 
  password               = aws_ssm_parameter.ziyo_ssm.value
  skip_final_snapshot    = true
  db_subnet_group_name   = aws_db_subnet_group.ziyotek_db_sg.id
  vpc_security_group_ids = [aws_security_group.ziyotek_devops_all_all.id]
}

resource "aws_db_subnet_group" "ziyotek_db_sg" {
  name       = "ziyotek"
  subnet_ids = [aws_subnet.devops_subnet_1.id, aws_subnet.devops_subnet_2.id]
}

resource "random_password" "password" {
  length           = 16
  special          = true
  override_special = "_%@"
}

resource "aws_ssm_parameter" "ziyo_ssm" {
  name  = "/ziyotek/devops/sbx/db_password"
  type  = "SecureString"
  key_id = aws_kms_key.db_key.key_id
  value = random_password.password.result
}

resource "aws_kms_key" "db_key" {
  description             = "key for db encryption1"
  deletion_window_in_days = 7
}

####################

# resource "aws_ssm_parameter" "ziyo_ssm_user" {
#   name  = "/ziyotek/devops/sbx/db_user"
#   value = "ziyotekuser"
# }

