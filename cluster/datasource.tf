data "terraform_remote_state" "vpc" {
  backend = "s3"
  config = {
    bucket         = "homeadvisor-test-allen-terraform"
    key            = "test/vpc.tfstate"
    region         = "us-west-2"
    profile        = "homeadvisor"
  }
}

data "aws_vpc" "this" {
  id = data.terraform_remote_state.vpc.outputs.vpc[0].vpc_id
}

data "aws_subnet_ids" "private" {
  vpc_id = data.aws_vpc.this.id
  filter {
    name   = "tag:type"
    values = ["private"]
  }
}

data "aws_eks_cluster" "this" {
  name = module.eks.cluster_id
}

data "aws_eks_cluster_auth" "this" {
  name = module.eks.cluster_id
}

data "aws_caller_identity" "current" {}