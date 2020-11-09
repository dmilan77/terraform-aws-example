module "ssh_sg" {
  source  = "terraform-aws-modules/security-group/aws//modules/ssh"

  name        = "ssh-server"
  description = "Security group for web-server with HTTP ports open within VPC"
  vpc_id      = module.my_eks_private_vpc.vpc_id

  ingress_cidr_blocks = ["45.17.197.126/32"]
}