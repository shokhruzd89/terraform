
locals {
  #bucket_name = "${var.bucket_name}-${local.prefix}"
  region = "${data.aws_region.current.id}"
  s3_suffix = "0000000"
  prefix = "beginig"
}

<<<<<<< HEAD
resource "aws_s3_bucket" "devops-s3-1-2-3" {
  bucket = "${local.bucket_name}-${local.region}-${local.s3_suffix}-${var.environment}"
=======
variable "bucket_names" {
  default = [
    "ziyotek-devops-practice-bucket",
    "personal-devops-practice-bucket",
    "office-devops-practice-bucket"
  ]
}

resource "aws_s3_bucket" "devops-s3-1" {

  count = var.create_s3 ? 3 : 0

  bucket = "${var.environment}-${var.bucket_names[0]}-${count.index}"
>>>>>>> 38195a33b3abfc89854bdadcd53e01381da7033e
  acl    = var.s3_acl
  server_side_encryption_configuration {
    rule {
      apply_server_side_encryption_by_default {
        sse_algorithm = "AES256"
      }
    }
  }
  versioning {
    enabled = var.versioning_enabled
  }
}


