module "ec2_nexus" {
  source  = "terraform-aws-modules/ec2-instance/aws"
  version = "5.0.0"

  name                        = "ec2-nexus"
  instance_type               = var.ec2_nexus.instance_type
  ami                         = var.ec2_nexus.ami
  key_name                    = "rsa-keypair"
  subnet_id                   = module.vpc.public_subnets[0]
  vpc_security_group_ids      = [module.nexus.security_group_id]
  associate_public_ip_address = true
  private_ip                  = "10.0.101.11"
  user_data                   = file(var.ec2_nexus.user_data)

  tags = {
    Name = "ec2-nexus"
  }
}

module "ec2_client" {
  source  = "terraform-aws-modules/ec2-instance/aws"
  version = "5.0.0"

  name                        = "ec2-client"
  instance_type               = var.ec2_client.instance_type
  ami                         = var.ec2_client.ami
  key_name                    = "rsa-keypair"
  subnet_id                   = module.vpc.public_subnets[0]
  vpc_security_group_ids      = [module.client.security_group_id]
  associate_public_ip_address = true
  private_ip                  = "10.0.101.12"
  user_data                   = file(var.ec2_client.user_data)

  tags = {
    Name = "ec2-client"
  }
}
