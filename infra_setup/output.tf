output "vpc_id" {
  description = "The ID of the VPC"
  value       = module.vpc.vpc_id
}

output "private_subnets_id" {
  description = "The ID of the Private Subnets"
  value       = module.vpc.private_subnets
}

output "rds_endpoint" {
  value = aws_db_instance.postgres.address
}