resource "aws_ecr_repository" "ecr" {
  name                 = var.name
  image_tag_mutability =  var.image_tag_mutability

  encryption_configuration {
    encryption_type = try(var.encryption_type, "KMS")
  }
   
  image_scanning_configuration {
    scan_on_push = var.scan_on_push
  }

  tags = var.tags
}