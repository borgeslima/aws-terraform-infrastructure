variable "vpc_name" {
  type = string
  description = "Name of VPC"
}

variable "vpc_cidr" {
    type = string
    description = "CIDR of VPC"
    sensitive = true
}

variable "vpc_azs" {
    type = list(string)
    description = "List of AZS"
}

variable "vpc_private_subnets" {
    type = list(string)
    description = "Private subnets"
}  

variable "vpc_public_subnets" {
  type = list(string)
}

variable "vpc_enable_nat_gateway" {
  type = bool
  description = "Enable nat Gateway"
  default = false
}

variable "vpc_single_nat_gateway" {
  type = bool
  description = "Enable single nat Gateway"
  default = false
}

variable "vpc_enable_dns_hostnames" {
  type = bool
  description = "Enable dns hostnames"
  default = false
}

variable "vpc_enable_flow_log" {
  type = bool
  description = "Enable flow logs"
  default = false
}


variable "vpc_create_flow_log_cloudwatch_iam_role" {
  type = bool
  description = "Enable flow cloudwatch iam role"
  default = false
}

variable "vpc_create_flow_log_cloudwatch_log_group" {
  type = bool
  description = "Enable flow cloudwatch iam role"
  default = false
}

variable "vpc_public_subnet_tags" {
    type = object({})
    description = "Public subnets tags"
}       

variable "vpc_private_subnet_tags" {
    type = object({})
    description = "Private subnets tags"
}  

variable "vpc_tags" {
    type = object({})
    description = "Tags of VPC"
}  
  

   