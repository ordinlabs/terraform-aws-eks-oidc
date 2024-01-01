terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

data aws_iam_policy_document this {
  version = "2012-10-17"
  statement {
    effect = "Allow"
    principals {
      type = "Federated"
      identifiers = [var.cluster_oidc_provider_arn]
    }
    actions = ["sts:AssumeRoleWithWebIdentity"]
    condition {
      test     = "StringEquals"
      variable = "${trimprefix(var.cluster_oidc_issuer_url, "https://")}:sub"
      values   = ["system:serviceaccount:${var.namespace}:${var.service_account_name}"]
    }
  }
}

resource "aws_iam_role" "this" {
  name_prefix = var.role_name_prefix
  assume_role_policy = data.aws_iam_policy_document.this.json
  tags = merge({
    ServiceAccountNameSpace = var.namespace
    ServiceAccountName      = var.service_account_name
  }, var.tags)
}

resource "aws_iam_role_policy_attachment" "this" {
  count = length(var.policy_arns)
  role       = aws_iam_role.this.name
  policy_arn = var.policy_arns[count.index]
}