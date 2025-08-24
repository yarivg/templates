data "env0_organization" "my_organization" {}

output "organization_name" {
  value = data.env0_organization.my_organization.name
}

resource "env0_project" "project_with_cd" {
  name = "test_project_with_var_visa"
  parent_project_id = var.PARENT_PROJECT_ID
}

resource "env0_project" "second_project" {
  name = "test_project_with_var_visa_second"
  parent_project_id = var.PARENT_PROJECT_ID
}

variable "PROJECT_VAR_VALUE" {
  default = "{\"project_metadata\": \"test\"}"
}
#resource "env0_project_policy" "example" {
#  project_id        = env0_project.project_with_cd.id
#
#  continuous_deployment_default = false
#  run_pull_request_plan_default = true
#}

resource "env0_configuration_variable" "project_var" {
  name       = "project_metadata"
  type       = "terraform"
  value      = var.PROJECT_VAR_VALUE
  project_id = null

  is_read_only = false
  is_sensitive = false
  format       = "JSON"

  depends_on = [env0_project.second_project]
}

