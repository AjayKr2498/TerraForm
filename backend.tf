terraform {
  backend "s3" {
   ##bucket name
   bucket = "ajay-2498-demo-test"
   key = "s3/terraform.tfstate"
   region = "us-east-2"
   # DynamoDB table name
   #dynamodb_table = "terraform-demo-locks"
   #encrypt = true
  }
}
