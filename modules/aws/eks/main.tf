module "eks" {
  source  = "terraform-aws-modules/eks/aws"
  version = "19.15.3"
  cluster_name                            = var.eks_cluster_name
  cluster_version                         = var.eks_cluster_version
  cluster_endpoint_private_access         = var.eks_cluster_endpoint_private_access
  cluster_endpoint_public_access          = var.eks_cluster_endpoint_public_access
  cluster_addons                          = var.eks_cluster_addons
  vpc_id                                  = var.eks_vpc_id
  subnet_ids                              = var.eks_private_subnets
  control_plane_subnet_ids                = var.eks_public_subnets
  eks_managed_node_group_defaults         = var.eks_eks_managed_node_group_defaults
  cluster_security_group_additional_rules = var.eks_cluster_security_group_additional_rules
  node_security_group_additional_rules    = var.eks_node_security_group_additional_rules
  eks_managed_node_groups                 = var.eks_managed_node_groups
  node_security_group_tags = var.eks_node_security_group_tags
  tags = var.eks_tags
}

data "aws_eks_cluster_auth" "eks" {
  name = "${module.eks.cluster_name}"
}
