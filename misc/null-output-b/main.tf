resource "null_resource" "null1" {
}

output "b" {
  value = "b as an output"
}

output "b_required_var" {
  value = var.b_required_var
}