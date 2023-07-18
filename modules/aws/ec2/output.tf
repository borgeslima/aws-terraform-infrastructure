
output "ami" {
  value = aws_instance.default.ami
}

output "instance_type" {
  value = aws_instance.default.instance_type
}