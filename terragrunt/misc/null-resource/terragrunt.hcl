generate "null_resource" {
  path = "tg.main.tf"
  if_exists = "overwrite_terragrunt"
  contents = <<EOF
resource "null_resource" "null" {
}
EOF
}


 generate "env0_metadata" {
  path      = ".env0_metadata"
  if_exists = "overwrite"
  contents  = <<EOF
# Copy-pasteable config node for the env0_admin/environments.yaml file

    - name: web_qa__${replace(path_relative_to_include(), "/", "__")}
      path: ./templates/terragrunt/misc/null-resource/${path_relative_to_include()}
      workflow: terragrunt
      terraform_version: ${run_cmd("terraform", "version", "")}
      custom_drift_detection_schedule: null
EOF
}
//       terraform_version: ${jsondecode(run_cmd("terraform", "version", "-json")).terraform_version}

generate "outputs" {
  path = "outputs.tf"
  if_exists = "overwrite_terragrunt"
  contents = <<EOF
  output "cluster_version" {
    value = "1.26"
  }

  output "fargate_profiles" {
    value = {}
  }

  output "some_value" {
    value = { "asdf" = "asdf" }
  }
EOF
}