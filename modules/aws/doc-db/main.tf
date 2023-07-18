resource "aws_docdb_subnet_group" "default" {
  name        = var.aws_docdb_cluster_subnet_group_name
  description = var.aws_docdb_cluster_subnet_group_description
  subnet_ids  = var.aws_docdb_cluster_subnet_group_subnet_ids
  tags        = var.aws_docdb_cluster_subnet_group_tags
}


resource "aws_docdb_cluster" "default" {
  availability_zones     = toset(var.availability_zones)
  cluster_identifier     = var.aws_docdb_cluster_identifier
  master_username        = var.aws_docdb_cluster_master_username
  master_password        = var.aws_docdb_cluster_master_password
  port                   = var.aws_docdb_cluster_db_port
  vpc_security_group_ids = try(var.aws_docdb_cluster_vpc_security_group_ids ,[])
  db_subnet_group_name   = join("", aws_docdb_subnet_group.default[*].name)
  engine                 = var.aws_docdb_cluster_engine
  tags                   = var.aws_docdb_cluster_tags
  skip_final_snapshot    = var.aws_docdb_skip_final_snapshot
}


resource "aws_docdb_cluster_instance" "default" {
  identifier                   = lower(var.aws_docdb_cluster_instance_identifier)
  cluster_identifier           = join("", aws_docdb_cluster.default[*].id)
  apply_immediately            = var.aws_docdb_cluster_instance_apply_immediately
  preferred_maintenance_window = var.aws_docdb_cluster_instance_preferred_maintenance_window
  instance_class               = var.aws_docdb_cluster_instance_instance_class
  engine                       = var.aws_docdb_cluster_instance_engine
  auto_minor_version_upgrade   = var.aws_docdb_cluster_instance_auto_minor_version_upgrade
  enable_performance_insights  = var.aws_docdb_cluster_instance_enable_performance_insights
  tags                         = var.aws_docdb_cluster_instance_tags
}






