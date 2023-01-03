provider "aws" {
    region = "us-east-2"
}

resource "aws_s3_bucket" "terraform-state" {
    bucket = "demo-ajaykumar240398-terraform"
    #basically it prevents accidental deletion of s3 bucket.
    lifecycle {
        prevent_destroy = true
        
    }
    #Enable versioning to see full revision of our state files
    versioning {
        enabled = true
    }
#enable server side encryption(SSE)
server_side_encryption_configuration {
    rule {
        apply_server_side_encryption_by_default {
            sse_algorithm = "AES256"
        }
    }
}
}

# resource "aws_dynamodb_table" "terraform_locks" {
#     hash_key = "LockID"
#     name = "terraform-demo-locks"
#     billing_mode = "PAY_PER_REQUEST"
#     attribute {
#         name = "LockID"
#         type = "S"
    }
}
