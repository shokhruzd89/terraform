variable "region" {
  type    = string
  default = "us-east-2"
}

variable "versioning_enabled" {
  type    = bool
  default = false
}

<<<<<<< HEAD
variable "bucket_name" {
  default = "shokhruz-123456"
}

=======
>>>>>>> 38195a33b3abfc89854bdadcd53e01381da7033e
variable "s3_acl" {
  default = "private"
}

variable "environment" {
    default = ""
}

variable "create_s3" {
  default = true
}