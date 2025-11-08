locals {
  env       = "prod" # enum: dev , staging
  eks_name  = "cluster-eks"
  cluster_name      = "${local.env}-${local.eks_name}"
  cluster_role_name = "${local.cluster_name}-cluster-role"
}