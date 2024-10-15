resource "null_resource" "null1" {
}

output "senobj" {
  value = var.senobj
}

output "senstr" {
  value = var.senstr
}

output "senlist" {
  value = var.senlist
}

output "senmap" {
  value = var.senmap
}

output "sennumber" {
  value = var.sennumber
}

// create boolean var, sets and use JSON encoding
output "senbool" {
  value = var.senbool
}

output "senset" {
  value = var.senset
}

output "senjson" {
  value = var.senjson
}


// Non Sensitive Outputs
output "non_senobj" {
  value = var.non_senobj
}

output "non_senstr" {
  value = var.non_senstr
}

output "non_senlist" {
  value = var.non_senlist
}

output "non_senmap" {
  value = var.non_senmap
}

output "non_sennumber" {
  value = var.non_sennumber
}

output "non_senbool" {
  value = var.non_senbool
}

output "non_senset" {
  value = var.non_senset
}

output "non_senjson" {
  value = var.non_senjson
}