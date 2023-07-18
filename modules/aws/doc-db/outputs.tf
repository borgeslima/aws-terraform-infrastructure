output "reader_endpoint" {
  value = aws_docdb_cluster.default.reader_endpoint
}

output "cluster_identifier" {
  value = aws_docdb_cluster.default.cluster_identifier
}