resource "null_resource" "null1" {
}

variable "dns" {
  type = object({
    ...
  })

  default = null
}

output "out_dns" {
  value = var.dns == null ? "null DNS" : "Existing DNS" + tostring(var.dns)
}

output "a" {
  value = "a as an output"
}
