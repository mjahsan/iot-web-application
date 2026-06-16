output "s3_bucket_arn" {
  type        = string
  description = "ARN of the S3 bucket" 
  value       = aws_s3_bucket.terraform_state.arn
}
output "dynamodb_table_arn" {
  type        = string
  description = "ARN of the DynamoDB table" 
  value       = aws_dynamodb_table.terraform_locks.arn
}