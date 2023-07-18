variable "vpc_id" {
  type = string
}

variable "peer_vpc_id" {
  type = string
}

variable "auto_accept" {
  type = bool
}

variable "tags" {
  type = any
}

variable "allow_remote_vpc_dns_resolution" {
  type = bool
  default = true
}

variable "destination_cidr_block_vpc" {
  type = string
}

variable "destination_cidr_block_peer_vpc" {
  type = string
}

variable "vpc_default_route_table_id" {
  type = string
}

variable "peer_vpc_default_route_table_id" {
  type = string
}