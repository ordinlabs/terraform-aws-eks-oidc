### AWS EKS OIDC Module

```
module oidc {
  source = "git@github.com:ordinlabs/terraform-aws-eks-oidc.git?ref=v0.0.1"
  cluster_oidc_provider_arn = "cluster oidc provider arn"
  cluster_oidc_issuer_url = "cluster oidc issuer url"
  service_account_name = "namespace"
  policy_arns = ["arn:aws:iam::aws:policy/FOO_BAR"]
#  namespace = "optional" #(defaults to "kube-system")
#  role_name_prefix = "optional-" #(defaults to "eks-oidc-")
#  tags {
#   "Foo" = "Bar"
#  }
}
```