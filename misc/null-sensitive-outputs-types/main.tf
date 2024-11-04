resource "null_resource" "null-sen" {
}

# primitive types
output "string_output" {
  value     = "sadfasdf"
  sensitive = true
}

output "empty_string_output" {
  value     = ""
  sensitive = true
}

output "null_string_output" {
  value     = null
  sensitive = true
}

output "boolean_output" {
  value     = true
  sensitive = true
}

output "numeric_output" {
  value     = 8
  sensitive = true
}

# complex types
variable "temp_list" {
  type    = list(string)
  default = ["a", "b", "c"]
}

output "list_sensitive" {
  value     = var.temp_list
  sensitive = true
}

output "empty_array" {
  value     = []
  sensitive = true
}

output "non_empty_array" {
  value     = [1, false, "asd", {}]
  sensitive = true
}

output "empty_object" {
  value     = {}
  sensitive = true
}

output "non_empty_object" {
  value = {
    "default" = {
      "count"                = 3
      "fargate_profile_name" = "default"
      "subnets" = [
        "subnet-0b3b3b3b3b3b3b3b3",
      ]
    }
  }
  sensitive = true
}