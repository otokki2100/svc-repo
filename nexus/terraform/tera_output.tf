output "nexus_ip" {
  value = module.ec2_nexus.public_ip
}

output "client_ip" {
  value = module.ec2_client.public_ip
}
