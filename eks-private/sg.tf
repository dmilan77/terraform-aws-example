module "private_api_vpc_443_sg" {
  source  = "terraform-aws-modules/security-group/aws//modules/https-443"

  name        = "eks-api-vpc-443"
  description = "Security group for web-server with HTTP ports open within VPC"
  vpc_id      = data.aws_vpc.vpc.id

  ingress_cidr_blocks = [data.aws_vpc.vpc.cidr_block]
}
