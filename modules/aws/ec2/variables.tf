variable "instance_type" {
  type = string
}

variable "ami" {
  type = string
}

variable "key_name" {
  type = string
}

variable "subnet_id" {
  type = string
}

variable "tags" {
  type = any
}

variable "security_groups" {
  type = list(string)
}

variable "associate_public_ip_address" {
  type = bool
  default = false
}