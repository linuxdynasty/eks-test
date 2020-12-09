data "terraform_remote_state" "vpc" {
  backend = "s3"
  config = {
    bucket         = "homeadvisor-test-allen-terraform"
    key            = "test/vpc.tfstate"
    region         = "us-west-2"
    profile        = var.profile
  }
}

data "terraform_remote_state" "eks" {
  backend = "s3"
  config = {
    bucket         = "homeadvisor-test-allen-terraform"
    key            = "test/eks.tfstate"
    region         = "us-west-2"
    profile        = var.profile
  }
}

data "aws_eks_cluster" "this" {
  name = data.terraform_remote_state.eks.outputs.cluster_id
}

data "aws_eks_cluster_auth" "this" {
  name = data.terraform_remote_state.eks.outputs.cluster_id
}

data "aws_availability_zones" "available" {}
data "aws_region" "current" {}

data "aws_route53_zone" "public" {
  name = "${var.domain}."
}

data "aws_iam_role" "external_dns" {
  name = "${data.terraform_remote_state.eks.outputs.cluster_id}-external-dns"
}