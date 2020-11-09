data "aws_eks_cluster" "cluster" {
  name = module.my-eks-cluster.cluster_id
}

data "aws_eks_cluster_auth" "cluster" {
  name = module.my-eks-cluster.cluster_id
}

provider "kubernetes" {
  host                   = data.aws_eks_cluster.cluster.endpoint
  cluster_ca_certificate = base64decode(data.aws_eks_cluster.cluster.certificate_authority.0.data)
  token                  = data.aws_eks_cluster_auth.cluster.token
  load_config_file       = false
  version                = "~> 1.9"
}


module "my-eks-cluster" {
  source          = "terraform-aws-modules/eks/aws"
  cluster_name    = var.eksclustername
  cluster_version = "1.17"
  vpc_id          = data.aws_vpc.vpc.id
  subnets         = data.aws_subnet_ids.private.ids
  cluster_endpoint_private_access = true
  cluster_endpoint_public_access = false
  cluster_security_group_id =  module.private_api_vpc_443_sg.this_security_group_id
  cluster_endpoint_private_access_cidrs =  [data.aws_vpc.vpc.cidr_block]

  worker_groups = [
    {
      instance_type = "t2.large"
      asg_max_size  = 1
    }
  ]
}