resource "null_resource" "null1" {
}

output "senobj" {
  value = {
    endpoint = "secert_endpoint"
    reader_endpoint = "secert_reader_endpoint"
    service = {
      username = "secret_service_username"
      fake_password = "secret_service_password"
    }
  }
  sensitive = true
}

output "senstr" {
  value = "some sensitive string 12348023480934#!@$@#"
  sensitive = true
}

output "senlist" {
  value = ["some-sensitive-list-element", "other-sensitive-list-element"]
  sensitive = true
}

output "senmap" {
  value = {
    sensitiveKeyyyy = "sensitiveValueeee"
  }
  sensitive = true
}

output "sennumber" {
  value = 1234567890
  sensitive = true
}

output "senbool" {
  value = true
  sensitive = true
}

output "senset" {
  value = toset(["sen sitive", "set"])
  sensitive = true
}

output "senjson" {
  value = jsonencode({
    senKey = "senValue"
  })
  sensitive = true
}


// Non Sensitive Outputs
output "non_senobj" {
  value = {
    endpoint = "<http://core.cluster-c6e7cyvkajcg.eu-west-2.rds.amazonaws.com|core.cluster-c6e7cyvkajcg.eu-west-2.rds.amazonaws.com>"
    reader_endpoint = "<http://core.cluster-c6e7cyvkajcg.eu-west-2.rds.amazonaws.com|core.cluster-c6e7cyvkajcg.eu-west-2.rds.amazonaws.com>"
    service = {
      username = "gitlab"
      fake_password = "foo"
    }
  }
}

output "non_senstr" {
  value = "public-string"
}

output "non_senlist" {
  value = ["public1", "public2"]
}

output "non_senmap" {
  value = {
    publicKeyyyy = "publicValueeee"
  }
}

output "non_sennumber" {
  value = 21222
}

output "non_senbool" {
  value = false
}

output "non_senset" {
  value = toset(["public_set1", "public_set2"])
}

output "non_senjson" {
  value = jsonencode({
    key = "value"
  })
}