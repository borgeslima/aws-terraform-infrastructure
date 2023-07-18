variable "name" {
    type = string
    description = "Name of Security Group"
}

variable "description" {
    type = string
    description = "Description of Security Group"
}

variable "vpc_id" {
    type = string
    description = "vpc id of Security Group"
}

variable "tags" {
    type = any
    description = "Tags id of Security Group"
}

variable "group_roles" {
   type = list(object({
    type        = string
    description = string
    from_port   = number
    to_port     = number
    protocol    = string
    cidr_blocks = list(string)
    # ource_security_group_id = list(string)
  }))
  description = "Security Group Roles"
}