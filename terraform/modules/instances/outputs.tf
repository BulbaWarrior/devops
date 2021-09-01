output "instance_ids" {
  description = "Id of the ec2 instance"
  value       = aws_instance.app_server[*].id
}

output "instance_public_ips" {
  value = aws_instance.app_server[*].public_ip
}
