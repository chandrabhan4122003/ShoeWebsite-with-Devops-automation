output "ec2_public_ip" {
  description = "Public IP of EC2 instance"
  value       = aws_instance.ecommerce_server.public_ip
}

output "ec2_public_dns" {
  description = "Public DNS of EC2 instance"
  value       = aws_instance.ecommerce_server.public_dns
}

output "instance_id" {
  description = "EC2 Instance ID"
  value       = aws_instance.ecommerce_server.id
}

output "security_group_id" {
  description = "Security Group ID"
  value       = aws_security_group.ecommerce_sg.id
}
