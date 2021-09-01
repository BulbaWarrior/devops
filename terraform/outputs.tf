
output "instance_ids" {
  description = "Id of the ec2 instance"
  value       = module.instances.instance_ids
}

output "instance_public_ips" {
  value = module.instances.instance_public_ips
}
