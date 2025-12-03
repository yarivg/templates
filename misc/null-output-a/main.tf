resource "null_resource" "null1" {
}

variable "dns" {
  type = object({
    name = string
    type = string
    value = string
  })
  
  default = null
}

output "out_dns" {
  value = var.dns == null ? "null DNS" : "Existing DNS" + tostring(var.dns)
}

output "a" {
  value = "a as an output"
}
