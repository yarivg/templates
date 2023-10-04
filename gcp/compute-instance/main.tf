provider "google" {
  project = "env0project"
  region  = "us-central1"
  zone  = "us-central1-a"
}

resource "google_compute_instance" "google-i2" {
  name         = "gcp-test-test2"
  machine_type = "n1-standard-1"

  boot_disk {
    initialize_params {
    image = "debian-cloud/debian-10"
    }
  }

  network_interface {
    # A default network is created for all GCP projects
    network       = "default"
    access_config {
    }
  }
}