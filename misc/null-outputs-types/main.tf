#terraform {
#  required_version = "1.5.7"
#  cloud {
#    hostname     = "backend-dev.api.dev.env0.com"
#    organization = "78036610-4c0d-448f-a440-81c4b9eb1d83.85828623-32df-4cf9-80a8-9aedbd1b7dbc"
#    workspaces {
#      name = "remote-backend-testing"
#    }
#  }
#}

resource "null_resource" "null4" {
}

output "string_test" {
  value = "sadfasdf"
}

output "empty_string" {
  value = ""
}

variable "non_sen_list" {
  type = list(string)
  default = ["a", "b", "c"]
}

output "non_sen_list" {
  value = var.non_sen_list
}

output "empty_object" {
  value = {}
}

output "empty_array" {
  value = []
}

output "non_empty_array" {
  value = [1,false,"asd", {}]
}

output "boolean_output" {
  value = true
}

output "numeric_output" {
  value = 8
}


output "non_empty_object" {
  value = {
    "default" = {
      "fargate_profile_name" = "default"
      "subnets" = [
        "subnet-0b3b3b3b3b3b3b3b3",
      ]
    }
  }
}