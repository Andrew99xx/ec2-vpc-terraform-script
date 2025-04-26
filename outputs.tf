output "instance_public_ips" {
  value = module.ec2.instance_public_ips
}

output "instance_private_ips" {
  value = module.ec2.instance_private_ips
}


output "ec2_private_key_pem"{
  value=module.ec2.ec2_private_key_pem
  sensitive = true
}