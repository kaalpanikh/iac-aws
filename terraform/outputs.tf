output "instance_public_ip" {
  description = "Public IP of the web server"
  value       = aws_instance.web_server.public_ip
}

output "instance_id" {
  description = "ID of the web server instance"
  value       = aws_instance.web_server.id
}

output "security_group_id" {
  description = "ID of the security group"
  value       = aws_security_group.web_server.id
}
