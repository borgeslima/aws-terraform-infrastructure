resource "aws_vpc_peering_connection" "peering" {
  vpc_id      = var.vpc_id
  peer_vpc_id = var.peer_vpc_id
  auto_accept = var.auto_accept
  tags        = var.tags


  accepter {
    allow_remote_vpc_dns_resolution = var.allow_remote_vpc_dns_resolution
  }

  requester {
    allow_remote_vpc_dns_resolution = var.allow_remote_vpc_dns_resolution
  }
}

resource "aws_vpc_peering_connection_accepter" "default" {
  vpc_peering_connection_id = aws_vpc_peering_connection.peering.id
  auto_accept               = true
  tags                      = merge(var.tags, tomap({ "Side" = "Accepter" }))
}


resource "aws_vpc_peering_connection_options" "default" {
  vpc_peering_connection_id = aws_vpc_peering_connection_accepter.default.id

  accepter {
    allow_remote_vpc_dns_resolution = var.allow_remote_vpc_dns_resolution
  }


  requester {
    allow_remote_vpc_dns_resolution = var.allow_remote_vpc_dns_resolution
  }
}

resource "aws_route" "route_vpc" {
  route_table_id         = var.vpc_default_route_table_id
  destination_cidr_block = var.destination_cidr_block_vpc
  vpc_peering_connection_id = aws_vpc_peering_connection.peering.id
}

resource "aws_route" "route_peer" {
  route_table_id         = var.peer_vpc_default_route_table_id
  destination_cidr_block = var.destination_cidr_block_peer_vpc
  vpc_peering_connection_id = aws_vpc_peering_connection.peering.id
}