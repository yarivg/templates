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
  value = var.dns == null ? "null DNS" : "The configured DNS name is: ${var.dns.name}"
}

output "a" {
  value = "a as an output"
}
