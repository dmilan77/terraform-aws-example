# module "private_api_vpc_443_sg" {
#   source  = "terraform-aws-modules/security-group/aws//modules/https-443"

#   name        = "eks-api-vpc-443"
#   description = "Security group for web-server with HTTP ports open within VPC"
#   vpc_id      = data.aws_vpc.vpc.id

#   ingress_cidr_blocks = [data.aws_vpc.vpc.cidr_block]
# }

resource "aws_security_group" "allow_all_in_vpc" {
  name        = "allow_all_within_vpc"
  description = "Allow All  within traffic"
  vpc_id      = data.aws_vpc.vpc.id

  ingress {
    description = "ALL from VPC"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = [data.aws_vpc.vpc.cidr_block]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "allow_tls"
  }
}