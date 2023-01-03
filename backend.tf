terraform {
  backend "S3" {
   #bucket name
   bucket = "demo-ajaykumar240398-terraform"
   key = "s3/terraform.tfstate"
   reion = "us-east-2"
   # DynamoDB table name
   dynamo_table = "terraform-demo-locks"
   encrypt = true
  }
}
