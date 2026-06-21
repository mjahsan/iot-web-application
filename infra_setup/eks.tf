module "eks" {
  source  = "terraform-aws-modules/eks/aws"
  version = "~> 21.0"

  name                        = var.eks_name
  kubernetes_version          = "1.34"
  create_cloudwatch_log_group = false  # Disables local log group management

  # Ensure the EKS Control Plane connects to your established network
  vpc_id     = module.vpc.vpc_id
  subnet_ids = module.vpc.private_subnets

  enable_cluster_creator_admin_permissions = true
  endpoint_public_access  = true
  endpoint_private_access = true


  eks_managed_node_groups = {
    development_nodes = {
      min_size     = 2
      max_size     = 4
      desired_size = 2

      instance_types = ["m7i-flex.large"]

      tags = {
        "kubernetes.io/cluster/${var.eks_name}" = "shared"
      }
    }
  }
}

/*
resource "aws_eks_addon" "vpc_cni" {
  cluster_name = var.eks_name
  addon_name   = "vpc-cni"
}

resource "aws_eks_addon" "coredns" {
  cluster_name = var.eks_name
  addon_name   = "coredns"
}

resource "aws_eks_addon" "kubeproxy" {
  cluster_name = var.eks_name
  addon_name   = "kube-proxy"
}
*/