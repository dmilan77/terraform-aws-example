module "ec2_cluster" {
  source                 = "terraform-aws-modules/ec2-instance/aws"
  version                = "~> 2.0"

  name                   = "bastion-host-eks"
  instance_count         = 1

  ami                    = data.aws_ami.amazon_linux2_ami.id
  instance_type          = "t2.micro"
  key_name               = module.my_key_pair.this_key_pair_key_name
  monitoring             = true
  vpc_security_group_ids = [module.ssh_sg.this_security_group_id]
  subnet_id              = module.my_eks_private_vpc.public_subnets[0]

  tags = {
    Terraform   = "true"
    Environment = "dev"
  }
}