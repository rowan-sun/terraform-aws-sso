variable "name" {
  type        = string
  description = "(Required, Forces new resource) The name of the Permission Set."
}

variable "tags" {
  type        = map(string)
  description = "(Optional) Key-value map of resource tags."
  default = {
    Terraform = "Yes"
  }
}
variable "description" {
  type        = string
  default     = ""
  description = "(Optional) The description of the Permission Set."
}
variable "relay_state" {
  type        = string
  default     = null
  description = "(Optional) The relay state URL used to redirect users within the application during the federation authentication process."
}
variable "session_duration" {
  type        = string
  default     = "PT1H"
  description = "(Optional) The length of time that the application user sessions are valid in the ISO-8601 standard. Default: PT1H."
}

variable "managed_policy_arns" {
  type        = list(string)
  description = "Managed polices ARNs"
}

variable "inline_policy" {
  type        = any
  description = "Inline policy JSON input"
}

variable "account_assignments" {
  type = list(object(
    {
      account_id         = string
      group_display_name = string
    }
    )
  )
}

