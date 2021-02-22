# terraform-aws-sso

[![Infrastructure Tests](https://www.bridgecrew.cloud/badges/github/cloud-security-labs/terraform-aws-sso/general)](https://www.bridgecrew.cloud/link/badge?vcs=github&fullRepo=cloud-security-labs%2Fterraform-aws-sso&benchmark=INFRASTRUCTURE+SECURITY) [![Infrastructure Tests](https://www.bridgecrew.cloud/badges/github/cloud-security-labs/terraform-aws-sso/cis_aws)](https://www.bridgecrew.cloud/link/badge?vcs=github&fullRepo=cloud-security-labs%2Fterraform-aws-sso&benchmark=CIS+AWS+V1.2)

## Assumptions

- AWS ORG created, with SSO enabled.
- AWS SSO enabled.
- AWS SSO Group is created.

## Requirements

| Name      | Version   |
| --------- | --------- |
| terraform | >= 0.14.0 |
| aws       | >= 3.24.0 |

## Providers

| Name | Version   |
| ---- | --------- |
| aws  | >= 3.24.0 |

## Modules

No Modules.

## Resources

| Name                                                                                                                                                           |
| -------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| [aws_identitystore_group](https://registry.terraform.io/providers/hashicorp/aws/3.24.0/docs/data-sources/identitystore_group)                                  |
| [aws_organizations_organization](https://registry.terraform.io/providers/hashicorp/aws/3.24.0/docs/data-sources/organizations_organization)                    |
| [aws_ssoadmin_account_assignment](https://registry.terraform.io/providers/hashicorp/aws/3.24.0/docs/resources/ssoadmin_account_assignment)                     |
| [aws_ssoadmin_instances](https://registry.terraform.io/providers/hashicorp/aws/3.24.0/docs/data-sources/ssoadmin_instances)                                    |
| [aws_ssoadmin_managed_policy_attachment](https://registry.terraform.io/providers/hashicorp/aws/3.24.0/docs/resources/ssoadmin_managed_policy_attachment)       |
| [aws_ssoadmin_permission_set_inline_policy](https://registry.terraform.io/providers/hashicorp/aws/3.24.0/docs/resources/ssoadmin_permission_set_inline_policy) |
| [aws_ssoadmin_permission_set](https://registry.terraform.io/providers/hashicorp/aws/3.24.0/docs/resources/ssoadmin_permission_set)                             |

## Inputs

| Name                  | Description                                                                                                                | Type                                                                                                                                | Default                                   | Required |
| --------------------- | -------------------------------------------------------------------------------------------------------------------------- | ----------------------------------------------------------------------------------------------------------------------------------- | ----------------------------------------- | :------: |
| account\_assignments  | n/a                                                                                                                        | <pre>list(object(<br>    {<br>      account_id         = string<br>      group_display_name = string<br>    }<br>    )<br>  )</pre> | n/a                                       |   yes    |
| description           | (Optional) The description of the Permission Set.                                                                          | `string`                                                                                                                            | `""`                                      |    no    |
| inline\_policy        | Inline policy JSON input                                                                                                   | `any`                                                                                                                               | n/a                                       |   yes    |
| managed\_policy\_arns | Managed polices ARNs                                                                                                       | `list(string)`                                                                                                                      | n/a                                       |   yes    |
| name                  | (Required, Forces new resource) The name of the Permission Set.                                                            | `string`                                                                                                                            | n/a                                       |   yes    |
| relay\_state          | (Optional) The relay state URL used to redirect users within the application during the federation authentication process. | `string`                                                                                                                            | `null`                                    |    no    |
| session\_duration     | (Optional) The length of time that the application user sessions are valid in the ISO-8601 standard. Default: PT1H.        | `string`                                                                                                                            | `"PT1H"`                                  |    no    |
| tags                  | (Optional) Key-value map of resource tags.                                                                                 | `map(string)`                                                                                                                       | <pre>{<br>  "Terraform": "Yes"<br>}</pre> |    no    |

## Outputs

| Name                    | Description |
| ----------------------- | ----------- |
| account\_ids            | n/a         |
| account\_names          | n/a         |
| identity\_store\_id     | n/a         |
| ssoadmin\_instance\_arn | n/a         |