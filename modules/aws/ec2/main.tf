resource "aws_instance" "default" {
  ami             = var.ami
  security_groups = try(var.security_groups, [])
  instance_type   = var.instance_type
  key_name        = var.key_name
  subnet_id       = var.subnet_id
  tags            = try(var.tags, {})
  associate_public_ip_address = var.associate_public_ip_address
}