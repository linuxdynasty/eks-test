locals {
  kubeconfig_aws_authenticator_command_args = [
    "--region",
    var.region,
    "eks",
    "--profile",
    "homeadvisor",
    "get-token",
    "--cluster-name",
    var.cluster_name,
  ]

  tags = {
    Env         = "test-allen"
    Name        = var.cluster_name
    Region      = var.region
    Account     = data.aws_caller_identity.current.account_id
    Owner       = "Allen"
  }
  node_groups = {
    stable = {
      desired_capacity = 1
      max_capacity     = 50
      min_capacity     = 1
      instance_type    = "m5a.large"
      k8s_labels = {
        Env = "test-allen"
      }
      additional_tags = {
        "node_type"                                     = "stable"
        "k8s.io/cluster-autoscaler/enabled"             = "true"
        "k8s.io/cluster-autoscaler/${var.cluster_name}" = "owned"
      }
    }
  }
}
