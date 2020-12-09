region       = "us-west-2"
cluster_name = "homeadvisor-test-allen-eks"
profile      = "homeadvisor"

node_groups_defaults = {
  ami_type  = "AL2_x86_64"
  disk_size = 100
}

enable_irsa = true

irsa = {
  external-dns = {
    namespace                = "kube-system"
    iam_policy_document_path = "iam_policies/external_dns.json"
  }
}