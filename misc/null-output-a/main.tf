resource "null_resource" "null1" {
}

variable "dns" {
  type = object({
    name = string
    type = string
    value = string
  })
  
  default = {name = "www", type = "A", value = "192.168.1.10"}
}

output "out_dns" {
  value = var.dns == null ? "null DNS" : "The configured DNS name is: ${var.dns.name}"
}

output "a" {
  value = "a as an output"
}
