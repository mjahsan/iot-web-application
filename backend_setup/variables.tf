variable "s3_bucket_name" {
  type        = string
  description = "Unique bucket name for state file storage" 
  default     = "landfill-dev-tf-state-storage-2026" # Must be globally unique
}

variable "dynamodb_table_name" {
  type        = string
  description = "Name for state file locking" 
  default     = "landfill-dev-tf-locks"
}