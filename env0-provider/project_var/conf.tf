terraform {
  required_providers {
    env0 = {
      version = "1.25.0"
      source  = "env0/env0"
    }
  }
}

variable "env0_api_key" {
  default = "***"
}
variable "env0_api_secret" {
  default = "***"
}

variable "TEAM_ID" {
  default = "***"
}

variable "ROLE_ID" {
  default = "***"
}

variable "PARENT_PROJECT_ID" {
  default = "***"
}

#output "some-output" {
#  value = "asd"
#}

#output "some-output-2" {
#  value = var.env0_api_key
#}
#
#output "some-output-3" {
#  value = "asd ${var.env0_api_key}"
#}

provider "env0" {
  api_key      = var.env0_api_key
  api_secret   = var.env0_api_secret
  api_endpoint = "https://api-dev.dev.env0.com"
}