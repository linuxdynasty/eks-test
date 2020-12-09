module "helm" {
  source       = "../modules/terraform-aws-helm"
  charts       = local.charts
  cluster_name = data.aws_eks_cluster.this.id
}