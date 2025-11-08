locals {
  env       = "prod" # enum: dev , staging
  region    = "us-west-2"
  zone1     = "us-west-2a"
  zone2     = "us-west-2b"
  eks_name  = "cluster EKS"

  cluster_name = "${local.env}-${local.eks_name}"
  cluster_role_name = "${local.env}-${local.eks_name}-cluster-role"
}