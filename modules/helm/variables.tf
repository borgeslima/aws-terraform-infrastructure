variable "helm_name" {
  type = string
}

variable "helm_repository" {
  type = string
}

variable "helm_values" {
  type = string
}

variable "helm_chart" {
  type = string
}

variable "helm_version" {
  type = string
}

variable "helm_namespace" {
  type = string
  default = "default"
}

variable "helm_force_update" {
  type = bool
  default = false
}

variable "helm_create_namespace" {
  type = bool
  default = false
}

variable "helm_timeout" {
  type = number
  default = 400
}

variable "helm_wait" {
  type = bool
  default = false
}

variable "helm_cleanup_on_fail" {
  type = bool
  default = false
}

variable "helm_disable_crd_hooks" {
  type = bool
  default = false
}

variable "helm_lint" {
  type = bool
  default = false
}