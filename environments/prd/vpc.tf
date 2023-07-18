### VPC ###

module "vpc" {

  source = "./aws/vpc"

  vpc_name                                 = "${var.vpc_name}-${random_string.sufix.result}"
  vpc_cidr                                 = var.vpc_cidr
  vpc_azs                                  = toset(var.vpc_azs)
  vpc_private_subnets                      = toset(var.vpc_private_subnets)
  vpc_public_subnets                       = toset(var.vpc_public_subnets)
  vpc_enable_nat_gateway                   = var.vpc_enable_nat_gateway
  vpc_single_nat_gateway                   = var.vpc_single_nat_gateway
  vpc_enable_dns_hostnames                 = var.vpc_enable_dns_hostnames
  vpc_enable_flow_log                      = var.vpc_enable_flow_log
  vpc_create_flow_log_cloudwatch_iam_role  = var.vpc_create_flow_log_cloudwatch_iam_role
  vpc_create_flow_log_cloudwatch_log_group = var.vpc_create_flow_log_cloudwatch_log_group

  vpc_public_subnet_tags = {
    "kubernetes.io/cluster/${var.eks_cluster_name}-${random_string.sufix.result}" = "shared"
    "kubernetes.io/role/elb"                                                      = 1
  }

  vpc_private_subnet_tags = {
    "kubernetes.io/cluster/${var.eks_cluster_name}-${random_string.sufix.result}" = "shared"
    "kubernetes.io/role/internal-elb"                                             = 1
  }

  vpc_tags = merge(var.tags, {

  })
}


module "vpc_peering" {

  source = "./aws/vpc-peering"

  vpc_id                          = module.vpc.vpc_id
  auto_accept                     = true
  allow_remote_vpc_dns_resolution = true
  destination_cidr_block_vpc      = var.vpc_cidr
  vpc_default_route_table_id      = module.vpc.vpc_default_route_table_id
  destination_cidr_block_peer_vpc = "" # "172.47.0.0/16"
  peer_vpc_id                     = "" # "vpc-01df3640d97d4f4db"
  peer_vpc_default_route_table_id = "" # "rtb-0abc71eac66236888"
  tags                            = merge(var.tags, {})

  depends_on = [module.vpc]
}