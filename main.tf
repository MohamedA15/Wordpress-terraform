module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "6.4.0"

  name               = var.Vpc_name
  cidr               = var.cidr_block
  azs                = var.azs
  private_subnets    = var.private_subnets
  public_subnets     = var.public_subnets
  enable_nat_gateway = true
  enable_vpn_gateway = true

  tags = {
    Terraform   = "true"
    Environment = "dev"
  }
}

module "security-group" {
  source                = "terraform-aws-modules/security-group/aws"
  version               = "5.3.0"

  name                  = var.sg_name
  description           = var.sg_description
  vpc_id                = module.vpc.vpc_id
  ingress_rules         = var.ingress_rules
  ingress_cidr_blocks   = var.ingress_cidr_blocks
  egress_rules          = ["all-all"]
}

module "ec2-instance" {
  source                = "terraform-aws-modules/ec2-instance/aws"
  version               = "6.1.1"

  name                  = "Wordpress"
  ami                   = var.ami_id
  availability_zone     = var.azs[0]
  instance_type         = var.instance_type
  vpc_security_group_ids = [module.security-group.security_group_id]
  subnet_id             = module.vpc.public_subnets[0]
  associate_public_ip_address = true
}