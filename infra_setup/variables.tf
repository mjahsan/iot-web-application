variable "env" {
  type        = string
  description = "Enviornment" 
  default     = "dev"
}
variable "vpc_name" {
  type        = string
  description = "VPC name" 
  default     = "landfill-dev-vpc"
}
variable "vpc_cidr" {
  type        = string
  description = "CIDR address" 
  default     = "10.0.0.0/16"
}
variable "eks_name" {
  type        = string
  description = "EKS cluster name" 
  default     = "landfill-production-cluster"
}