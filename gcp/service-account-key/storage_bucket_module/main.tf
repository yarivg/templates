resource "google_storage_bucket" "my_bucket" {
  name     = var.bucket_name
  location = var.location
}

output "bucket_name" {
  value = google_storage_bucket.my_bucket.name
}