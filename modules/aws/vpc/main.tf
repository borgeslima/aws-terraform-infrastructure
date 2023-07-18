module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "~> 5.0.0"
  name = var.vpc_name
  cidr = var.vpc_cidr
  azs             = toset(var.vpc_azs)
  private_subnets = toset(var.vpc_private_subnets)
  public_subnets  = toset(var.vpc_public_subnets)
  enable_nat_gateway   = var.vpc_enable_nat_gateway
  single_nat_gateway   = var.vpc_single_nat_gateway
  enable_dns_hostnames = var.vpc_enable_dns_hostnames
  enable_flow_log                      = var.vpc_enable_flow_log
  create_flow_log_cloudwatch_iam_role  = var.vpc_create_flow_log_cloudwatch_iam_role
  create_flow_log_cloudwatch_log_group = var.vpc_create_flow_log_cloudwatch_log_group
  public_subnet_tags = var.vpc_public_subnet_tags
  private_subnet_tags = var.vpc_private_subnet_tags
  tags = var.vpc_tags
}
