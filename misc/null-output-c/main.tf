resource "null_resource" "null1" {
}

output "c" {
  value = "c as an output"
}

output "c_required_var" {
  value = var.c_required_var
}