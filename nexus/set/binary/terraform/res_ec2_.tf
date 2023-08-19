module "ec2_nexus" {
  source  = "terraform-aws-modules/ec2-instance/aws"

  name                        = "ec2-nexus"
  instance_type               = var.ec2_nexus.instance_type
  ami                         = var.ec2_nexus.ami
  key_name                    = "rsa-keypair-${timestamp()}"
  subnet_id                   = module.vpc.public_subnets[0]
  vpc_security_group_ids      = [module.nexus.security_group_id]
  associate_public_ip_address = true
  private_ip                  = "10.0.101.11"

  user_data = templatefile("${var.wiki_code_path_local}/lang-code/shell/os/init-pub/init-${var.ec2_nexus.dist}.sh.tpl", {
    user   = var.ec2_nexus.user,
    dist   = var.ec2_nexus.dist,
    domain = var.ec2_nexus.domain,
  })

  root_block_device = [{
    volume_size = "100"
    volume_type = "gp3"
    encrypted             = true
    delete_on_termination = true    
  }]

  tags = {
    Name = "ec2-nexus"
  }
}

module "ec2_client" {
  source  = "terraform-aws-modules/ec2-instance/aws"

  name                        = "ec2-client"
  instance_type               = var.ec2_client.instance_type
  ami                         = var.ec2_client.ami
  key_name                    = "rsa-keypair-${timestamp()}"
  subnet_id                   = module.vpc.public_subnets[0]
  vpc_security_group_ids      = [module.client.security_group_id]
  associate_public_ip_address = true
  private_ip                  = "10.0.101.12"

  user_data = templatefile("${var.wiki_code_path_local}/lang-code/shell/os/init-pri/init-${var.ec2_client.dist}.sh.tpl", {
    user   = var.ec2_client.user,
    dist   = var.ec2_client.dist,
    domain = var.ec2_client.domain,
  })

  root_block_device = [{
    volume_size = "100"
    volume_type = "gp3"
    encrypted             = true
    delete_on_termination = true    
  }]

  tags = {
    Name = "ec2-client"
  }
}
