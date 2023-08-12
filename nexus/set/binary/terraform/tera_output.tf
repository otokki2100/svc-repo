output "domain" {
  value = local.domain
}

output "nexus" {
  value = "http://${local.domain}:8081"
}

output "vm_nexus_info_id" {
  value = module.ec2_nexus.id
}

output "vm_nexus_info_instance_type" {
  value = var.ec2_nexus.instance_type
}

output "vm_nexus_ssh_1_user" {
  value = var.ec2_nexus.user
}

output "vm_nexus_ssh_2_ip" {
  value = module.ec2_nexus.public_ip
}

output "vm_nexus_ssh_3_ssh" {
  value = "ssh ${var.ec2_nexus.user}@${module.ec2_nexus.public_ip} -o StrictHostKeyChecking=no -i id_rsa"
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
