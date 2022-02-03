# variable "ami_id" {
#   default = "ami-0231217be14a6f3ba"
# }
variable "environment" {
    default = ""
}

variable "instance_type" {
  default = "t2.micro"
}

variable "subnet_id" {
    default = ""
}
 
variable "vpc_security_group" {
    type = list
    default = null
}

variable "instance_profile" {
    default = null
}

variable "key_name" {
  default = "devops-class-key"
}