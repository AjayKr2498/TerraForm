# AWS Provider # This is for your profile. 
provider "aws" {
region = "us-east-2"
}

resource "aws_efs_file_system" "example-efs" {
   creation_token = "example-efs"
   performance_mode = "generalPurpose"
   throughput_mode = "bursting"
   encrypted = "true"
tags = {
     Name = "TestEFS"
   }
}  
# VPC
resource "aws_vpc" "AccuKox" {
tags = {
Name = "AccuKnox"
  }
}  
#EFS security group
resource "aws_security_group" "ingress-efs-test" {
   name = "ingress-efs-test-sg"
   vpc_id = "${aws_vpc.test-env.id}"
   ingress {
     security_groups = ["${aws_security_group.ingress-test-env.id}"]
     from_port = 2049
     to_port = 2049
     protocol = "tcp"
   }
   egress {
     security_groups = ["${aws_security_group.ingress-test-env.id}"]
     from_port = 0
     to_port = 0
     protocol = "-1"
   }

}
#Using lifecycle policy
#   lifecycle_policy {
#     transition_to_ia = "AFTER_30_DAYS"
#   }

#Using EFS policy
resource "aws_efs_file_system_policy" "policy" {
  file_system_id = aws_efs_file_system.fs.id

  bypass_policy_lockout_safety_check = true

  policy = <<POLICY
{
    "Version": "2012-10-17",
    "Id": "",
    "Statement": [
        {
            "Sid": "ExampleStatement01",
            "Effect": "Allow",
            "Principal": {
                "AWS": "*"
            },
            "Resource": "${aws_efs_file_system.fs.arn}",
            "Action": [
                "elasticfilesystem:ClientMount",
                "elasticfilesystem:ClientWrite"
            ],
            "Condition": {
                "Bool": {
                    "aws:SecureTransport": "true"
                }
            }
        }
    ]
}
POLICY
}  
