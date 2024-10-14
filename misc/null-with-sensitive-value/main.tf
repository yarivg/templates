resource "null_resource" "null1" {
}

output "sensitive_obj" {
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

output "sensitive_str" {
  value = "sensitive string"
  sensitive = true
}

output "sensitive_list" {
  value = ["sensitive", "list"]
  sensitive = true
}

output "sensitive_map" {
  value = {
    key = "value"
  }
  sensitive = true
}

output "sensitive_number" {
  value = 42
  sensitive = true
}

// non sensitive
output "non_sensitive_obj" {
  value = {
    endpoint = "<http://core.cluster-c6e7cyvkajcg.eu-west-2.rds.amazonaws.com|core.cluster-c6e7cyvkajcg.eu-west-2.rds.amazonaws.com>"
    reader_endpoint = "<http://core.cluster-c6e7cyvkajcg.eu-west-2.rds.amazonaws.com|core.cluster-c6e7cyvkajcg.eu-west-2.rds.amazonaws.com>"
    service = {
      username = "gitlab"
      fake_password = "foo"
    }
  }
}

output "non_sensitive_str" {
  value = "non sensitive string"
}

output "non_sensitive_list" {
  value = ["non sensitive", "list"]
}

output "non_sensitive_map" {
  value = {
    key = "value"
  }
}

output "non_sensitive_number" {
  value = 42
}