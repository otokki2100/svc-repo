resource "local_file" "ansible_inventory" {
  filename        = "./hosts"
  file_permission = "0600"
  content  = <<-EOT
all:
  hosts:
    ec2_gitlab:
      ansible_host: ${module.ec2_gitlab.public_ip}
      ansible_connection: ssh
      ansible_user: ${var.ec2_gitlab.user}
      ansible_ssh_private_key_file: id_rsa
      ansible_ssh_common_args: "-o StrictHostKeyChecking=no"
    ec2_client:
      ansible_host: ${module.ec2_client.public_ip}
      ansible_connection: ssh
      ansible_user: ${var.ec2_client.user}
      ansible_ssh_private_key_file: id_rsa
      ansible_ssh_common_args: "-o StrictHostKeyChecking=no"
  EOT
}
