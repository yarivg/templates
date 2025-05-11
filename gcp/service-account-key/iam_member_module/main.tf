resource "google_project_iam_member" "viewer" {
  count   = 2
  project = var.project_id
  role    = "roles/viewer"
  member  = "serviceAccount:iamMember@${var.project_id}.iam.gserviceaccount.com"
}

output "iam_member" {
    value = google_project_iam_member.viewer[*].member
}
