terraform {
  backend "s3" {
    profile        = "homeadvisor"
    bucket         = "homeadvisor-test-allen-terraform"
    key            = "test/vpc.tfstate"
    region         = "us-west-2"
  }
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "3.19.0"
    }
  }
}
