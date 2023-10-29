data "aws_region" "current" {
  
}

output "aws_region" {
  value = data.aws_region.current
}

output "eks_cluster_name" {
  value = module.eks.cluster_name
}
