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

resource "google_service_account_key" "key" {
  service_account_id = google_service_account.account.name
  public_key_type    = "TYPE_X509_PEM_FILE"
}

resource "google_project_iam_member" "viewer" {
  project = var.project_id
  role    = "roles/viewer"
  member  = "serviceAccount:yariv-service-account-tf@yariv-project-id-1234.iam.gserviceaccount.com"
}

## Compute Instance
resource "google_compute_instance" "smallest_vm" {
  name         = "smallest-vm"
  machine_type = "e2-micro"
  zone         = "us-central1-a"

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-11"
    }
  }

  network_interface {
    network = "default"
    access_config {} # Required for external IP
  }
}

## Cloud Run Service
resource "google_cloud_run_service" "default" {
  name     = "yariv-test-cloudrun-srv"
  location = "us-central1"

  template {
    spec {
      containers {
        image = "us-docker.pkg.dev/cloudrun/container/hello"
      }
    }
  }

  traffic {
    percent         = 100
    latest_revision = true
  }
}

## Modules
module "iam_member" {
  source      = "./iam_member_module"
  project_id  = var.project_id
  member      = "yariv-service-account-tf@yariv-project-id-1234.iam.gserviceaccount.com"
}

## Non GCP Resources
resource "null_resource" "demo_null_resource" {
}

## Outputs
output "iam_member_output" {
  value = module.iam_member.iam_member
}