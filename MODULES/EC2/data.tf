data "aws_ami" "example" {
   most_recent  = true 
   owners  = ["amazon"]


   filter {
        name = "name"
        values = ["amzn2-ami-hvm-*-x86_64-gp2"]

   } 
}

output "data-sourcr-ami" {
    value = data.aws_ami.example.image_id
  
}