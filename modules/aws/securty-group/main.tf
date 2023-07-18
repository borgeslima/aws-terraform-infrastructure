resource "aws_security_group" "default" {
  name        = var.name
  description = var.description
  vpc_id      = var.vpc_id
  tags        = merge(var.tags, {

  })
}

resource "aws_security_group_rule" "role" {
  for_each = { for idx, role in var.group_roles : idx => role }

  type              = try(each.value.type, "egress")
  description       = try(each.value.description, "Allow all egress traffic")
  from_port         = try(each.value.from_port, 0)
  to_port           = try(each.value.to_port, 0)
  protocol          = try(each.value.protocol, "-1")
  cidr_blocks       = try(each.value.cidr_blocks, (each.value.self ? [] : ["0.0.0.0/0"]))
  security_group_id = join("", aws_security_group.default[*].id)
  # source_security_group_id = try(toset(each.value.source_security_group_id), [""])
  # self = try(each.value.self, null)
}