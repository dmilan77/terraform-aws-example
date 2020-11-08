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
  cluster_name    = "my-eks-cluster"
  cluster_version = "1.17"
  subnets         = module.eksvpc.private_subnets
  vpc_id          = module.eksvpc.vpc_id
  cluster_endpoint_private_access = true
  cluster_endpoint_public_access = false
  cluster_endpoint_private_access_cidrs =  [module.eksvpc.default_vpc_cidr_block]

  worker_groups = [
    {
      instance_type = "t2.large"
      asg_max_size  = 1
    }
  ]
}