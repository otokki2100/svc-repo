output "domain" {
  value = local.domain
}

output "gitlab" {
  value = "https://${local.domain}"
}

output "vm_gitlab_info_id" {
  value = module.ec2_gitlab.id
}

output "vm_gitlab_info_instance_type" {
  value = var.ec2_gitlab.instance_type
}

output "vm_gitlab_ssh_1_user" {
  value = var.ec2_gitlab.user
}

output "vm_gitlab_ssh_2_ip" {
  value = module.ec2_gitlab.public_ip
}

output "vm_gitlab_ssh_3_ssh" {
  value = "ssh ${var.ec2_gitlab.user}@${module.ec2_gitlab.public_ip} -o StrictHostKeyChecking=no -i id_rsa"
}

output "vm_client_info_id" {
  value = module.ec2_client.id
}

output "vm_client_info_instance_type" {
  value = var.ec2_client.instance_type
}

output "vm_client_ssh_1_user" {
  value = var.ec2_client.user
}

output "vm_client_ssh_2_ip" {
  value = module.ec2_client.public_ip
}

output "vm_client_ssh_3_ssh" {
  value = "ssh ${var.ec2_client.user}@${module.ec2_client.public_ip} -o StrictHostKeyChecking=no -i id_rsa"
}
