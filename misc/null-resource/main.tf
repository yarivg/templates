resource "null_resource" "null_beta_fix" {
  triggers = {
    branch = "feature/beta-fix"
  }
}
