resource "aws_ssoadmin_account_assignment" "this" {
  for_each           = { for i, v in var.account_assignments : i => v }
  instance_arn       = aws_ssoadmin_permission_set.this.instance_arn
  permission_set_arn = aws_ssoadmin_permission_set.this.arn
  principal_id       = data.aws_identitystore_group.this[each.value.group_display_name].group_id
  principal_type     = "GROUP"
  target_type        = "AWS_ACCOUNT"
  target_id          = each.value.account_id
}

resource "aws_ssoadmin_permission_set" "this" {
  name             = var.name
  description      = var.description
  instance_arn     = local.sso_instance_arn
  relay_state      = var.relay_state
  session_duration = var.session_duration
  tags             = var.tags
}

resource "aws_ssoadmin_managed_policy_attachment" "this" {
  count              = length(var.managed_policy_arns)
  instance_arn       = aws_ssoadmin_permission_set.this.instance_arn
  permission_set_arn = aws_ssoadmin_permission_set.this.arn
  managed_policy_arn = var.managed_policy_arns[count.index]
}

resource "aws_ssoadmin_permission_set_inline_policy" "this" {
  count              = length(var.inline_policy) > 0 ? 1 : 0
  inline_policy      = var.inline_policy
  instance_arn       = aws_ssoadmin_permission_set.this.instance_arn
  permission_set_arn = aws_ssoadmin_permission_set.this.arn
}
