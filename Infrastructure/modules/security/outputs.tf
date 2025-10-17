output "web_sg_id" {
  description = "Web Security Group ID"
  value       = aws_security_group.web_sg.id
}

output "alb_sg_id" {
  description = "ALB Security Group ID"
  value       = aws_security_group.alb_sg.id
}

output "db_sg_id" {
  description = "Database Security Group ID"
  value       = aws_security_group.db_sg.id
}