module "aws_sqs_topic" {
  source                      = "terraform-aws-modules/sqs/aws"
  name                        = var.name
  tags                        = var.tags
  fifo_queue                  = var.fifo_queue
  content_based_deduplication = var.content_based_deduplication
}