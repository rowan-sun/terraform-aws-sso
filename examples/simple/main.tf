provider "aws" {
  region = "us-east-1"
}

module "permission_set" {
  source = "../../"

  name             = "test"
  description      = "Provides full test access to AWS services and resources"
  session_duration = "PT2H"

  account_assignments = [
    {
      group_display_name = "test"
      account_id         = "485469387396"
    },
    {
      group_display_name = "test"
      account_id         = "768397815941"
    }
  ]
  managed_policy_arns = [
    "arn:aws:iam::aws:policy/AdministratorAccess"
  ]

  /* inline_policy = "" */
  inline_policy = data.aws_iam_policy_document.example.json

  tags = {
    Just_For_Testing = "True"
    Remove_Me        = "Please"
  }
}


