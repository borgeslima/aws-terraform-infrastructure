resource "random_string" "sufix" {
  length  = var.length
  special = var.special
}