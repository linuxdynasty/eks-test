variable "region" {
  type        = string
  description = "AWS Region to use"
}

variable "namespaces" {
  type        = list(string)
  description = "List of Kubernetes namespaces to create"
}

variable "domain" {
  type        = string
  description = "The domain name to use."
}

variable "profile" {
  type        = string
  description = "The AWS profile to use."
}