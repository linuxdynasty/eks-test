data "template_file" "this" {
  for_each = var.irsa
  template = file(each.value.iam_policy_document_path)
  vars = {
    cluster_id = module.eks.cluster_id
  }
}

resource "aws_iam_policy" "this" {
  for_each    = var.irsa
  name_prefix = "${module.eks.cluster_id}-${each.key}"
  description = "${module.eks.cluster_id}'s EKS cluster IRSA policy for ${each.key}"
  policy      = data.template_file.this[each.key].rendered
}

module "iam_assumable_roles" {
  for_each                      = var.irsa
  source                        = "terraform-aws-modules/iam/aws//modules/iam-assumable-role-with-oidc"
  version                       = "3.4.0"
  create_role                   = true
  role_name                     = "${module.eks.cluster_id}-${each.key}"
  provider_url                  = replace(module.eks.cluster_oidc_issuer_url, "https://", "")
  role_policy_arns              = [aws_iam_policy.this[each.key].arn]
  oidc_fully_qualified_subjects = ["system:serviceaccount:${var.irsa[each.key].namespace}:${each.key}"]
  force_detach_policies         = true
  number_of_role_policy_arns    = 1
  role_description              = "${module.eks.cluster_id} EKS cluster's ${each.key} IRSA role"
}
