terraform {
  required_version  = ">=0.12.3"
}

provider "google" {
  version = ">=3.0.0"
  project = "env0project"
}

resource "google_project_iam_member" "my_project_member" {
  project = "env0project"
  role    = "roles/editor"
  member  = "user:yariv.gavriel@env0.com"
}