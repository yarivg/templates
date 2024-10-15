resource "null_resource" "null1" {
}

output "senobj" {
  value = var.sen_obj
}

output "senstr" {
  value = var.sen_str
}

output "senlist" {
  value = var.sen_list
}

output "senmap" {
  value = var.sen_map
}

output "sennumber" {
  value = var.sen_number
}

// create boolean var, sets and use JSON encoding
output "senbool" {
  value = var.sen_bool
}

output "senset" {
  value = var.sen_set
}

output "senjson" {
  value = var.sen_json
}


// Non Sensitive Outputs
output "non_senobj" {
  value = var.non_sen_obj
}

output "non_senstr" {
  value = var.non_sen_str
}

output "non_senlist" {
  value = var.non_sen_list
}

output "non_senmap" {
  value = var.non_sen_map
}

output "non_sennumber" {
  value = var.non_sen_number
}

output "non_senbool" {
  value = var.non_sen_bool
}

output "non_senset" {
  value = var.non_sen_set
}

output "non_senjson" {
  value = var.non_sen_json
}