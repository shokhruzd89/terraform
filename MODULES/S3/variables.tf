variable "region" {
  type    = string
  default = "us-east-2"
}

variable "versioning_enabled" {
  type    = bool
  default = false
}

variable "bucket_name" {
  default = "shokhruz-123456"
}

variable "s3_acl" {
  default = "private"
}

variable "environment" {
    default = ""
}