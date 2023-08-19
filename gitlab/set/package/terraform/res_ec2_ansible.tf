resource "local_file" "ansible_inventory" {
  filename        = "./hosts"
  file_permission = "0600"
  content  = <<-EOT
all:
  hosts:
    ec2-gitlab:
      ansible_host: ${module.ec2_gitlab.public_ip}
      ansible_connection: ssh
      ansible_user: ${var.ec2_gitlab.user}
      ansible_ssh_private_key_file: id_rsa
      ansible_ssh_common_args: "-o StrictHostKeyChecking=no"

    ec2-client:
      ansible_host: ${module.ec2_client.public_ip}
      ansible_connection: ssh
      ansible_user: ${var.ec2_client.user}
      ansible_ssh_private_key_file: id_rsa
      ansible_ssh_common_args: "-o StrictHostKeyChecking=no"
  EOT
}

resource "local_file" "ansible_variables" {
  filename        = "ansible_variables.yml"
  file_permission = "0600"
  content         = <<-EOT
region: ${var.region}
myip: ${var.myip}
wiki_code_path_local: ${var.wiki_code_path_local}
wiki_code_path_remote_1: ${var.wiki_code_path_remote_1}
wiki_code_path_remote_2: ${var.wiki_code_path_remote_2}

instance_type_1: ${var.ec2_gitlab.instance_type}
ami_1: ${var.ec2_gitlab.ami}
user_1: ${var.ec2_gitlab.user}
dist_1: ${var.ec2_gitlab.dist}
domain_1: ${var.ec2_gitlab.domain}

instance_type_2: ${var.ec2_client.instance_type}
ami_2: ${var.ec2_client.ami}
user_2: ${var.ec2_client.user}
dist_2: ${var.ec2_client.dist}
domain_2: ${var.ec2_client.domain}
  EOT
}
