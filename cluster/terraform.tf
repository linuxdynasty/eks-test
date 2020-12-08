terraform {
  backend "s3" {
    profile        = "homeadvisor"
    bucket         = "homeadvisor-test-allen-terraform"
    key            = "test/eks.tfstate"
    region         = "us-west-2"
  }
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "3.19.0"
    }
    local = {
      source  = "hashicorp/local"
      version = "2.0.0"
    }
    null = {
      source  = "hashicorp/null"
      version = "3.0.0"
    }
    template = {
      source  = "hashicorp/template"
      version = "2.2.0"
    }
    kubernetes = {
      source  = "hashicorp/kubernetes"
      version = "1.13.3"
    }
  }
}