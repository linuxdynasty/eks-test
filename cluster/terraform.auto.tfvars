region       = "us-west-2"
cluster_name = "homeadvisor-test-allen-eks"
profile      = "homeadvisor"

node_groups_defaults = {
  ami_type  = "AL2_x86_64"
  disk_size = 100
}

irsa = {
  external-dns = {
    namespace                = "kube-system"
    iam_policy_document_path = "iam_policies/external_dns.json"
  },
  cluster-autoscaler = {
    namespace                = "kube-system"
    iam_policy_document_path = "iam_policies/cluster_autoscaler.json"
  },
  aws-load-balancer-controller = {
    namespace                = "kube-system"
    iam_policy_document_path = "iam_policies/aws_load_balancer_controller.json"
  }
}