module "nexus" {
  source  = "terraform-aws-modules/security-group/aws"

  name   = "nexus"
  vpc_id = module.vpc.vpc_id

  ingress_with_cidr_blocks = [
    {
      from_port   = 22
      to_port     = 22
      protocol    = "tcp"
      cidr_blocks = "${var.myip}/32"
    },
    {
      from_port   = 3389
      to_port     = 3389
      protocol    = "tcp"
      cidr_blocks = "${var.myip}/32"
    },
    {
      from_port   = 8081
      to_port     = 8081
      protocol    = "tcp"
      cidr_blocks = "${var.myip}/32"
    },
    {
      from_port   = 3128
      to_port     = 3128
      protocol    = "tcp"
      cidr_blocks = "${module.vpc.vpc_cidr_block}"
    },
    {
      from_port   = 5000
      to_port     = 5000
      protocol    = "tcp"
      cidr_blocks = "${module.vpc.vpc_cidr_block}"
    },
    {
      from_port   = 8081
      to_port     = 8081
      protocol    = "tcp"
      cidr_blocks = "${module.vpc.vpc_cidr_block}"
    }
  ]

  egress_with_cidr_blocks = [
    {
      from_port   = 0
      to_port     = 0
      protocol    = "-1"
      cidr_blocks = "0.0.0.0/0"
    }
  ]
}

module "client" {
  source  = "terraform-aws-modules/security-group/aws"

  name   = "client"
  vpc_id = module.vpc.vpc_id

  ingress_with_cidr_blocks = [
    {
      from_port   = 22
      to_port     = 22
      protocol    = "tcp"
      cidr_blocks = "${var.myip}/32"
    },
    {
      from_port   = 3389
      to_port     = 3389
      protocol    = "tcp"
      cidr_blocks = "${var.myip}/32"
    }    
  ]

  egress_with_cidr_blocks = [
    {
      from_port   = 3128
      to_port     = 3128
      protocol    = "tcp"
      cidr_blocks = "10.0.101.11/32"
    },
    {
      from_port   = 8081
      to_port     = 8081
      protocol    = "tcp"
      cidr_blocks = "10.0.101.11/32"
    }
  ]
}
