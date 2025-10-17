output "db_endpoint" {
  description = "Database endpoint"
  value       = aws_db_instance.main.endpoint
}

output "db_username" {
  description = "Database username"
  value       = aws_db_instance.main.username
}

output "db_name" {
  description = "Database name"
  value       = aws_db_instance.main.db_name
}