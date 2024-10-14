resource "null_resource" "null1" {
}

output "senobj" {
  value = {
    endpoint = "<http://core.cluster-c6e7cyvkajcg.eu-west-2.rds.amazonaws.com|core.cluster-c6e7cyvkajcg.eu-west-2.rds.amazonaws.com>"
    reader_endpoint = "<http://core.cluster-c6e7cyvkajcg.eu-west-2.rds.amazonaws.com|core.cluster-c6e7cyvkajcg.eu-west-2.rds.amazonaws.com>"
    service = {
      username = "gitlab"
      fake_password = "foo"
    }
  }
  sensitive = true
}

output "senstr" {
  value = "sen sitive string"
  sensitive = true
}

output "senlist" {
  value = ["sen sitive", "list"]
  sensitive = true
}

output "senmap" {
  value = {
    key = "value"
  }
  sensitive = true
}

output "sennumber" {
  value = 42
  sensitive = true
}

// create boolean var, sets and use JSON encoding
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
    key = "value"
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
  value = "non sen string"
}

output "non_senlist" {
  value = ["non sen sitive", "list"]
}

output "non_senmap" {
  value = {
    key = "value"
  }
}

output "non_sennumber" {
  value = 42
}

output "non_senbool" {
  value = true
}

output "non_senset" {
  value = toset(["non sen sitive", "set"])
}

output "non_senjson" {
  value = jsonencode({
    key = "value"
  })
}