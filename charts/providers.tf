provider "aws" {
  version = "3.14.1"
  region  = var.region
  profile = var.profile
}

provider "kubernetes" {
  host                   = data.aws_eks_cluster.this.endpoint
  cluster_ca_certificate = base64decode(data.aws_eks_cluster.this.certificate_authority.0.data)
  token                  = data.aws_eks_cluster_auth.this.token
  load_config_file       = false
  version                = ">= 1.11.2"
}

provider "random" {
  version = "3.0.0"
}