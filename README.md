### AWS EKS OIDC Module
=====================================

## Example Usage

```hcl
module oidc {
  source                    = "git@github.com:ordinlabs/terraform-aws-eks-oidc.git?ref=v0.0.1"
  cluster_oidc_provider_arn = "cluster oidc provider arn"
  cluster_oidc_issuer_url   = "cluster oidc issuer url"
  service_account_name      = "name of the service account"
  namespace                 = "namespace of the service account"
  iam_policy_arns           = ["arn:aws:iam::aws:policy/FOO_BAR"]
}
```

## Inputs

| Name                      | Description                                               | Type           | Default       | Required |
|---------------------------|-----------------------------------------------------------|----------------|---------------|:--------:|
| cluster_oidc_provider_arn | aws_iam_openid_connect_provider arn from aws              | `string`       |               |   yes    |
| cluster_oidc_issuer_url   | List of github repos to allow use of defined policies     | `list(string)` |               |   yes    |
| service_account_name      | kubernetes service account name                           | `string`       |               |   yes    |
| iam_policy_arns           | List of iam policy arns to apply                          | `list(string)` |               |   yes    |
| namespace                 | kubernetes namespace the service account is in            | `string`       | `kube-system` |    no    |
| role_name_prefix          | prefix for aws iam role                                   | `string`       | `eks-oidc-`   |    no    |
| tags                      | Tags to apply to the AWS resources created by this module | `map(string)`  | `{}`          |    no    |

## Outputs

| Name     | Description                                                     |
|----------|-----------------------------------------------------------------|
| role_arn | the created role arn to use in your service account annotations |
