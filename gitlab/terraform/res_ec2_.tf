module "ec2_gitlab" {
  source  = "terraform-aws-modules/ec2-instance/aws"
  version = "5.0.0"

  name                        = "ec2-gitlab"
  instance_type               = var.ec2_gitlab.instance_type
  ami                         = var.ec2_gitlab.ami
  key_name                    = "rsa-keypair-${timestamp()}"
  subnet_id                   = module.vpc.public_subnets[0]
  vpc_security_group_ids      = [module.gitlab.security_group_id]
  associate_public_ip_address = true
  private_ip                  = "10.0.101.11"
  user_data                   = templatefile(var.ec2_gitlab.user_data, {
    domain                    = local.domain,
  })

  root_block_device = [{
    volume_size = "100"
    volume_type = "gp3"
    encrypted             = true
    delete_on_termination = true    
  }]

  tags = {
    Name = "ec2-gitlab"
  }
}

module "ec2_client" {
  source  = "terraform-aws-modules/ec2-instance/aws"
  version = "5.0.0"

  name                        = "ec2-client"
  instance_type               = var.ec2_client.instance_type
  ami                         = var.ec2_client.ami
  key_name                    = "rsa-keypair-${timestamp()}"
  subnet_id                   = module.vpc.public_subnets[0]
  vpc_security_group_ids      = [module.client.security_group_id]
  associate_public_ip_address = true
  private_ip                  = "10.0.101.13"
  user_data                   = file(var.ec2_client.user_data)

  tags = {
    Name = "ec2-client"
  }
}
