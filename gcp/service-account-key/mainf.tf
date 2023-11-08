terraform {
  required_version  = ">=0.12.3"
}

provider "google" {
  credentials = file("env0_credential_configuration.json")
  version = ">=3.0.0"
  project = "env0project"
}

resource "google_service_account" "account" {
  account_id   = "yariv-test-account-id"
  display_name = "yariv"
}

resource "google_service_account_key" "key" {
  service_account_id = google_service_account.account.name
  public_key_type    = "TYPE_X509_PEM_FILE"
}