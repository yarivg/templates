resource "null_resource" "null1" {
}

output "a" {
  value = {
    endpoint = "<http://core.cluster-c6e7cyvkajcg.eu-west-2.rds.amazonaws.com|core.cluster-c6e7cyvkajcg.eu-west-2.rds.amazonaws.com>"
  }
  sensitive = true
}