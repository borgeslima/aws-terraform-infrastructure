
### VPC ###

vpc_name                                 = "loyalty"
vpc_cidr                                 = "172.0.0.0/16"
vpc_azs                                  = ["us-east-1a", "us-east-1b", "us-east-1c"]
vpc_private_subnets                      = ["172.0.48.0/24", "172.0.64.0/24", "172.0.80.0/24"]
vpc_public_subnets                       = ["172.0.0.0/24", "172.0.16.0/24", "172.0.32.0/24"]
vpc_enable_nat_gateway                   = true
vpc_single_nat_gateway                   = true
vpc_enable_dns_hostnames                 = true
vpc_enable_flow_log                      = true
vpc_create_flow_log_cloudwatch_iam_role  = true
vpc_create_flow_log_cloudwatch_log_group = true


### EKS ###

eks_cluster_name                    = "loyalty"
eks_cluster_version                 = "1.25"
eks_cluster_endpoint_private_access = true
eks_cluster_endpoint_public_access  = true

eks_cluster_addons = {}

eks_cluster_security_group_additional_rules = {
  egress_nodes_ephemeral_ports_tcp = {
    description                = "To node 1025-65535"
    protocol                   = "tcp"
    from_port                  = 1025
    to_port                    = 65535
    type                       = "egress"
    source_node_security_group = true
  }
}

eks_eks_managed_node_group_defaults = {
  ami_type                              = "AL2_x86_64"
  attach_cluster_primary_security_group = true
  create_security_group                 = true
}

eks_node_security_group_additional_rules = {
  ingress_self_all = {
    description = "Node to node all ports/protocols"
    protocol    = "-1"
    from_port   = 0
    to_port     = 0
    type        = "ingress"
    self        = true
  }
  egress_all = {
    description      = "Node all egress"
    protocol         = "-1"
    from_port        = 0
    to_port          = 0
    type             = "egress"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }
}

### SPOT NODE GROUP  ###

eks_managed_node_groups = {
  spot = {
    name           = "node-group-1"
    min_size       = 1
    max_size       = 3
    platform       = "bottlerocket"
    instance_types = ["m6i.large"]
    desired_size   = 2
    capacity_type  = "SPOT"
  }

  on_demand = {
    name           = "node-group-2"
    min_size       = 1
    max_size       = 3
    platform       = "bottlerocket"
    instance_types = ["m5.xlarge"]
    desired_size   = 2
    capacity_type  = "ON_DEMAND"
  }
}


### VPC PEERING ###


destination_cidr_block_peer_vpc = "172.47.0.0/16"
peer_vpc_id                     = "vpc-01df3640d97d4f4db"
peer_vpc_default_route_table_id = "rtb-0abc71eac66236888"


### HELMS ###


helms = {

  nginx = {
    name             = "ingress-nginx"
    repository       = "https://kubernetes.github.io/ingress-nginx"
    chart            = "ingress-nginx"
    namespace        = "ingress-nginx"
    values           = "./helms/ingress-nginx/values.yaml"
    force_update     = true
    create_namespace = true
    version          = "4.7.0"
  }

}

tags = {
  environment = "dev"
}