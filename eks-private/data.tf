data "aws_vpc" "vpc" {
  filter {
    name   = "tag:Name"
    values = [var.vpcname]
  }
}
data "aws_subnet_ids" "private" {
  vpc_id = data.aws_vpc.vpc.vpc_id

  tags = {
    Tier = "Private"
  }
}