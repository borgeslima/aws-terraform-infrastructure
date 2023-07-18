provider "aws" {
  region = "us-east-1"
}

resource "random_string" "sufix" {
  length  = 3
  special = false
}

module "eks" {
  source                                      = "./aws/eks"
  eks_cluster_name                            = "${var.eks_cluster_name}-${random_string.sufix.result}"
  eks_cluster_version                         = var.eks_cluster_version
  eks_cluster_endpoint_private_access         = var.eks_cluster_endpoint_private_access
  eks_cluster_endpoint_public_access          = var.eks_cluster_endpoint_public_access
  eks_cluster_addons                          = var.eks_cluster_addons
  eks_vpc_id                                  = module.vpc.vpc_id
  eks_private_subnets                         = module.vpc.private_subnets
  eks_public_subnets                          = module.vpc.public_subnets
  eks_eks_managed_node_group_defaults         = var.eks_eks_managed_node_group_defaults
  eks_cluster_security_group_additional_rules = var.eks_cluster_security_group_additional_rules

  eks_node_security_group_additional_rules = merge(
    var.eks_node_security_group_additional_rules
  )
  
  eks_managed_node_groups = merge(
    var.eks_managed_node_groups
  )

  eks_node_security_group_tags = merge({
      "kubernetes.io/cluster/${var.eks_cluster_name}-${random_string.sufix.result}" = null
  })

  eks_tags = {}
}


