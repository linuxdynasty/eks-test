
module "eks" {
  source                                    = "terraform-aws-modules/eks/aws"
  version                                   = "13.2.1"
  enable_irsa                               = var.enable_irsa
  cluster_name                              = var.cluster_name
  cluster_version                           = var.cluster_version
  cluster_log_retention_in_days             = var.cluster_log_retention_in_days
  kubeconfig_name                           = var.cluster_name
  subnets                                   = data.aws_subnet_ids.private.ids
  vpc_id                                    = data.aws_vpc.this.id
  tags                                      = local.tags
  node_groups_defaults                      = var.node_groups_defaults
  node_groups                               = local.node_groups
  kubeconfig_aws_authenticator_command      = var.kubeconfig_aws_authenticator_command
  kubeconfig_aws_authenticator_command_args = local.kubeconfig_aws_authenticator_command_args
}