output "vm_gitlab_ip" {
  value = module.ec2_gitlab.public_ip
}

output "vm_client_ip" {
  value = module.ec2_client.public_ip
}

output "domain" {
  value = local.domain
}
