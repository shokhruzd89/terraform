
variable "environment" {
  default = ""
}

variable "subnet_ids" {
    default=""
    }

variable "dbase_storage" {
  default = "10"
}

variable "dbase_version" {
  default = "10.15"
}

variable "dbase_name" {
  default = "ziyotek_devops16"
}

variable "dbase_username" {
  default = "ziyotekuser"
}

  
variable "vpc_security_group" {
    default = ""
    }
