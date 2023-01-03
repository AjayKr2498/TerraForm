terraform {
  backend "demoS3" {
   #bucket name
   bucket = "demo-ajaykumar240398-terraform"
   key = ""
   reion = "us-east-2"
   # DynamoDB table name
   dynamo_table = "terraform-demo-locks"
   encrypt = true
  }
}
