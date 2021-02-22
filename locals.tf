locals {
  identity_store_id = tolist(data.aws_ssoadmin_instances.this.identity_store_ids)[0]
  sso_instance_arn  = tolist(data.aws_ssoadmin_instances.this.arns)[0]
  group_list        = toset(values({ for index, mapping in var.account_assignments : index => mapping.group_display_name }))
}
