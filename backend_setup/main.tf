# -------------------------------------------------------------------------------
# BACKEND S3 BUCKET AND DYNAMODB TABLE STATE LOCKING FOR INFRA
#--------------------------------------------------------------------------------

resource "aws_s3_bucket" "terraform_state" {
  bucket        = var.s3_bucket_name
  lifecycle {prevent_destroy = true}
}

resource "aws_dynamodb_table" "terraform_locks" {
  name         = var.dynamodb_table_name
  billing_mode = "PAY_PER_REQUEST"
  hash_key     = "LockID"

  attribute {
    name = "LockID"
    type = "S"
  }
}