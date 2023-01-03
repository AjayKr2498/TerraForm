resource "aws_instance" "myec2" {
  ami           = "ami-0a606d8395a538502"
  instance_type = "t2.micro"
}
