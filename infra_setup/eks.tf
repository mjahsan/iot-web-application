module "eks" {
  source  = "terraform-aws-modules/eks/aws"
  version = "~> 21.0"

  name                        = var.eks_name
  kubernetes_version          = "1.33"
  create_cloudwatch_log_group = false  # Disables local log group management

  # Ensure the EKS Control Plane connects to your established network
  vpc_id     = module.vpc.vpc_id
  subnet_ids = module.vpc.private_subnets

  eks_managed_node_groups = {
    development_nodes = {
      min_size     = 2
      max_size     = 4
      desired_size = 2

      instance_types = ["t3.medium"]
    }
  }
}