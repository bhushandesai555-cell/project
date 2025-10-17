output "alb_dns_name" {
  description = "ALB DNS Name"
  value       = aws_lb.web_alb.dns_name
}

output "asg_name" {
  description = "Auto Scaling Group Name"
  value       = aws_autoscaling_group.web_asg.name
}

output "launch_template_id" {
  description = "Launch Template ID"
  value       = aws_launch_template.web_server.id
}