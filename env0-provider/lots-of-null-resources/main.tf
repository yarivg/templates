terraform {
  required_providers {
    env0 = {
      source  = "env0/env0"
    }
  }
}

# Provider credentials can be set via variables (recommended) or environment variables
# ENV0_API_KEY and ENV0_API_SECRET
provider "env0" {
  api_key      = var.env0_api_key
  api_secret   = var.env0_api_secret
  api_endpoint = var.api_endpoint
}

variable "template_count" {
  description = "Number of templates to create"
  type        = number
  default     = 5
}

variable "env0_api_key" {
  description = "env0 API key (can also be provided via ENV0_API_KEY)"
  type        = string
  default     = null
  sensitive   = true
}

variable "env0_api_secret" {
  description = "env0 API secret (can also be provided via ENV0_API_SECRET)"
  type        = string
  default     = null
  sensitive   = true
}

variable "api_endpoint" {
  description = "Optional custom API endpoint for the env0 provider (e.g., https://api.env0.com). Leave null to use provider default."
  type        = string
  default     = null
}

variable "template_base_name" {
  description = "Base name for generated templates"
  type        = string
  default     = "example"
}

locals {
  templates = [
    for i in range(var.template_count) : {
      name        = format("%s-%02d", var.template_base_name, i + 1)
      description = format("Example template %02d", i + 1)
    }
  ]
}

resource "env0_template" "example_github_installation_id" {
  for_each               = { for t in local.templates : t.name => t }
  name                   = each.value.name
  description            = each.value.description
  repository             = "https://github.com/env0/templates"
  terraform_version      = "1.1.9"
  github_installation_id = 11477608
}

output "created_templates" {
  description = "Names of the created env0 templates"
  value       = keys(env0_template.example_github_installation_id)
}