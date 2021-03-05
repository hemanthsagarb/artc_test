module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "2.47.0"

  name                 = "artc-dev"
  cidr                 = "10.0.0.0/16"
  azs                  = data.aws_availability_zones.available.names
  private_subnets      = ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24"]
  public_subnets       = ["10.0.4.0/24", "10.0.5.0/24", "10.0.6.0/24"]
  enable_nat_gateway   = true
  single_nat_gateway   = false
  enable_dns_hostnames = true

  public_subnet_tags = {
    "kubernetes.io/cluster/${local.cluster_name}" = "shared"
    "kubernetes.io/role/elb"                      = "1"
  }

  private_subnet_tags = {
    "kubernetes.io/cluster/${local.cluster_name}" = "shared"
    "kubernetes.io/role/internal-elb"             = "1"
  }
}


resource "aws_db_subnet_group" "or_demo_rds_subnet_group" {
  name       = "artc-dev-rds-dbsubnetgroup"
  subnet_ids = module.vpc.private_subnets

  tags = {
    Name = "artc-dev-rds-dbsubnetgroup"
  }
}
