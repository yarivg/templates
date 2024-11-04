variable "object_from_output" {
  default = {}
}

resource "null_resource" "null-resource" {
  count = var.object_from_output.count
}