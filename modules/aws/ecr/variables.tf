variable "name" {
  type = string
  description = "Name of ECR"
}

variable "image_tag_mutability" {
    type = string
    default = "MUTABLE"
    description = "Image tag Mutability"
}

variable "scan_on_push" {
  type = bool
  default = true
  description = "Image Scanning On Push ECR"
}

variable "tags" {
  type = any
  description = "Tags of ECR"
}

variable "encryption_type" {
  type = string
  default = "KMS"
}