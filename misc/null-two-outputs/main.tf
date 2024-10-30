terraform {
  cloud {
    hostname     = "backend.api.env0.com"
    organization = "9b9d59d4-6504-425b-a79c-e0c12effd592.8965a555-0e11-4d4c-a8ba-ec2d77d65016"
    workspaces {
      name = "remote-backend-testing"
    }
  }
}

resource "null_resource" "null4" {
}

output "firstOutput" {
  value = "some-value-1st4"
}

output "objectOutput" {
  value = {
    key1 = "value1"
    key2 = "value2"
  }
}