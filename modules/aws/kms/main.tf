resource "aws_kms_key" "this" {
  description             = var.description
  deletion_window_in_days = var.deletion_window_in_days
  policy                  = var.policy
  enable_key_rotation     = var.enable_key_rotation
}