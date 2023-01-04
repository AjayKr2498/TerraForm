provider "aws" {
     region = "us-east-2"
 }

resource "aws_instance"  {
  ami           = "ami-0a606d8395a538502"
  instance_type = "t2.micro"
}
