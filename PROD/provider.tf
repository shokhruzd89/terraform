provider "aws" {
  region = "us-east-2"
  default_tags {
    tags = {
      Name        = "ziyotek-devops-class"
      Environment = var.environment
    }
  }

}

