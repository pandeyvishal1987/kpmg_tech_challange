
module "app_vpc" {
  source = "terraform-aws-modules/vpc/aws"

  name = "app_vpc"
  cidr = var.vpc_cidr

  azs              = var.zones
  private_subnets  = var.private_subnets
  public_subnets   = var.public_subnets
  database_subnets = var.db_subnet

  private_subnet_suffix  = "pvt"
  public_subnet_suffix   = "pub"
  database_subnet_suffix = "db"
  public_subnet_tags = {
    "Name" = "public_subnet_web"
  }
  private_subnet_tags = {
    "Name" = "private_subnet_app"
  }

  database_subnet_group_name   = "db-subnet-group"
  create_database_subnet_group = true

  enable_dns_hostnames = true
  enable_dns_support   = true
  enable_nat_gateway   = true

  tags = {
    env       = "dev"
    Terraform = "true"
  }
}
