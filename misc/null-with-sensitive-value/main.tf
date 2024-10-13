resource "null_resource" "null1" {
}

output "a" {
  value = {
    test_var = {
      username = "asd"
      name = "dsa"
    }
  }
  sensitive = true
}