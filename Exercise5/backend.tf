terraform {
  backend "s3" {
    bucket = "kops-bucket-storage111"
    key = "terraform/backend"
    region = "us-east-2"
  }
}