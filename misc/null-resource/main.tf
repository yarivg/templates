resource "null_resource" "null_alpha_fix" {
  triggers = {
    branch = "feature/alpha-fix"
  }
}
