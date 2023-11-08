provider "google" {

}

resource "null_resource" "null1" {
}

resource "null_resource" "null2" {
}

resource "null_resource" "null3" {
}

resource "google_storage_bucket" "example_bucket" {
  name     = "example-terraform-bucket"
  location = "US"
}

output "asd" {
  value = "some text"
}