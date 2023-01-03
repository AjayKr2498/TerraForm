terraform {
  backend "s3" {
   ##bucket name
   bucket = "demo-ajaykumar240398-terraform"
   key = "s3/terraform.tfstate"
   region = "us-east-2"
   # DynamoDB table name
   dynamodb_table = "terraform-demo-locks"
   encrypt = true
  }
}
