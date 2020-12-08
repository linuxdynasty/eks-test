variable "cluster_name" {
  description = "EKS Cluster name"
  type        = string
}

variable "region" {
  description = "AWS Region to spin up this VPC at"
  type        = string
}

variable "cluster_log_retention_in_days" {
  description = "Number of days to retain log events. Default retention - 90 days."
  type        = number
  default     = 90
}

variable "cluster_version" {
  description = "Kubernetes version to use for the EKS cluster."
  type        = string
  default     = "1.18"
}

variable "node_groups_defaults" {
  description = "Map of values to be applied to all node groups. See node_groups module's documentaton for more details"
  type        = any
}

variable "kubeconfig_aws_authenticator_command" {
  description = "Command to use to fetch AWS EKS credentials."
  type        = string
  default     = "aws"
}

variable "profile" {
  description = "AWS profile to use"
  type        = string
}

variable "irsa" {
  description = "Map of IAM roles and services accounts to create and match"
  type = map(
    object(
      {
        namespace                = string
        iam_policy_document_path = string
      }
    )
  )
}