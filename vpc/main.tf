module "vpc" {
  source               = "terraform-aws-modules/vpc/aws"
  version              = "2.64.0"
  name                 = local.vpc_name
  cidr                 = var.vpn_cidr_block
  azs                  = data.aws_availability_zones.available.names
  private_subnets      = var.private_subnet_cidrs
  public_subnets       = var.public_subnet_cidrs
  enable_nat_gateway   = var.enable_nat_gateway
  single_nat_gateway   = var.single_nat_gateway
  enable_dns_hostnames = var.enable_dns_hostnames
  public_subnet_tags = {
    "kubernetes.io/cluster/homeadvisor-test-allen-eks" = "owned"
    "kubernetes.io/role/elb"                  = "1"
    "type"                                    = "public"
  }
  private_subnet_tags = {
    "kubernetes.io/cluster/homeadvisor-test-allen-eks" = "owned"
    "kubernetes.io/role/internal-elb"         = "1"
    "type"                                    = "private"
  }
}
