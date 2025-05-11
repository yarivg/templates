resource "google_project_iam_member" "viewer" {
  count   = 2
  project = var.project_id
  role    = "roles/viewer"
  member  = "serviceAccount:${var.member}"
}

output "iam_member" {
    value = google_project_iam_member.viewer[*].member
}
