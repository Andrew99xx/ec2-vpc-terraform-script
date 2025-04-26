output "instance_public_ips" {
  description = "Public IPs of all EC2 instances"
  value       = [for instance in aws_instance.public_ec2 : instance.public_ip]
}
output "instance_private_ips" {
  description = "Private IPs of all EC2 instances"
  value       = [for instance in aws_instance.public_ec2 : instance.private_ip]
}

output "ec2_private_key_pem" {
  description = "The private key for the EC2 instance"
  value       = tls_private_key.ec2_private_key.private_key_pem
  sensitive   = true
}
