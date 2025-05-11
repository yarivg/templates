terraform {
  required_version  = "1.5.7"
}

provider "google" {
  version = ">=3.0.0"
  project = var.project_id
}

## Data Resources
data "google_service_account" "account" {
  account_id = "yariv-test@${var.project_id}.iam.gserviceaccount.com"
  project = var.project_id
}

## GCP Resource
resource "google_service_account" "account" {
  account_id   = var.account_id
  display_name = var.account_display_name
}

#resource "google_service_account_key" "key" {
#  service_account_id = google_service_account.account.name
#  public_key_type    = "TYPE_X509_PEM_FILE"
#}
#
#resource "google_storage_bucket" "storage_buckets" {
#  count    = 2
#  name     = "yariv-demo-buckets-${count.index}-${var.project_name}"
#  location = "US"
#  project = var.project_id
#}

resource "google_project_iam_member" "viewer" {
  count   = 2
  project = "your-project-id"
  role    = "roles/viewer"
  member  = "serviceAccount:asd${count.index}@gmail.com"
}

## Modules
module "storage_bucket" {
  source      = "./storage_bucket_module"
  bucket_name = "yariv-demo-bucket-${var.account_id}"
  location    = "US"
  project_id  = var.project_id
}

## Non GCP Resources
resource "null_resource" "demo_null_resource" {
}

## Outputs
output "bucket_name" {
  value = module.storage_bucket.bucket_name
}