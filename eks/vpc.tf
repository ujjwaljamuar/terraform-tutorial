module "vpc" {
  source = "terraform-aws-modules/vpc/aws"

  name = "my-eks-vpc"

  cidr = "192.168.0.0/16"
  azs  = slice(data.aws_availability_zones.available.names, 0, 3)

  public_subnets  = ["192.168.1.0/24", "192.168.2.0/24", "192.168.3.0/24"]
  private_subnets = ["192.168.4.0/24", "192.168.5.0/24", "192.168.6.0/24"]

  enable_nat_gateway   = true
  single_nat_gateway   = true
  enable_dns_hostnames = true

  public_subnet_tags = {
    "kubernetes.io/cluster/${local.cluster_name}" = "shared"
    "kubernetes.io/role/elb"                      = 1
  }

  private_subnet_tags = {
    "kubernetes.io/cluster/${local.cluster_name}" = "shared"
    "kubernetes.io/role/internal-elb"             = 1
  }
} 