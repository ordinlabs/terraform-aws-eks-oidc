variable role_name_prefix {
  type = string
  description = "name prefix for the IAM role"
  default = "eks-oidc-"
}

variable service_account_name {
  type = string
  description = "k8 service account name"
}

variable cluster_oidc_issuer_url {
  type = string
  description = "The URL of the OIDC issuer URL"
}

variable cluster_oidc_provider_arn {
  type = string
  description = "The AWS ARN of the cluster's OIDC provider"
}

variable tags {
  type = map(string)
  description = "Tags to apply to resources"
  default = {}
}

variable namespace {
  type = string
  description = "The namespace the service account belongs to"
  default = "kube-system"
}

variable "iam_policy_arns" {
  type = list(string)
  description = "List of IAM policy ARNs to attach to the role"
}
