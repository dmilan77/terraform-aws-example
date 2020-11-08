terraform {
  backend "s3" {
    bucket = "tf-state-dmilan"
    key    = "demo/my-eks-private-vpc"
    region = "us-east-1"
  }
}