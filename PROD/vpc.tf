module "vpc" {
  source = "../MODULES/VPC"
 
  vpc_cidr = "10.20.0.0/16"
}