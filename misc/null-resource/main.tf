resource "null_resource" "null_gamma_fix" {
  triggers = {
    branch = "feature/gamma-fix"
  }
}
