provider "aws" {
     region = "us-west-2"
 }

resource "aws_instance" "demo" {
  ami           = "ami-0a606d8395a538502"
  instance_type = "t2.micro"
}
