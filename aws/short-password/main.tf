terraform {
  cloud {
    hostname     = "backend-dev.api.dev.env0.com"
    organization = "bd12a04a-b051-4f51-9a8a-8a32ac198802.3cb78079-de2c-4aa8-b7e2-7eb0f1c797c8"
    workspaces {
      name = "short-password"
    }
  }
  required_version = "1.5.7"
}

resource "aws_iam_account_password_policy" "fail_insecure_password" {
  minimum_password_length        = var.password_length  # Controlled via variable
  require_lowercase_characters   = false  # Missing requirement
  require_uppercase_characters   = false  # Missing requirement
  require_numbers                = false  # Missing requirement
  require_symbols                = false  # Missing requirement
  allow_users_to_change_password = false  # Missing requirement
  max_password_age               = 365    # Too long (above allowed 90)
  password_reuse_prevention      = 1      # Too low (below required 5)
  hard_expiry                    = false
}