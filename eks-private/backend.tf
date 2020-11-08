terraform {
  backend "s3" {
    bucket = "tf-state-dmilan"
    key    = "demo/my-eks-cluster-private"
    region = "us-east-1"
  }
}