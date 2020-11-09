# aws ec2 describe-images --region us-east-1 --image-ids ami-0947d2ba12ee1ff75
data "aws_ami" "amazon_linux2_ami" {
  most_recent = true
  owners           = ["137112412989"]

  filter {
    name   = "name"
    values = ["amzn2-ami-hvm-2.0.*-x86_64-gp2"]
  }
  filter {
    name   = "architecture"
    values = ["x86_64"]
  }
}