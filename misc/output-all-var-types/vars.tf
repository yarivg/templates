variable "sen_bool" {
  type = bool
}

variable "sen_json" {
  type = string
}

variable "sen_list" {
  type = list(string)
}

variable "sen_map" {
  type = map(string)
}

variable "sen_number" {
  type = number
}

variable "sen_obj" {
  type = map(string)
}

variable "sen_set" {
  type = set(string)
}

variable "sen_str" {
  type = string
}


# non-sensitive variables
variable "non_sen_bool" {
  type = bool
}

variable "non_sen_json" {
  type = string
}

variable "non_sen_list" {
  type = list(string)
}

variable "non_sen_map" {
  type = map(string)
}

variable "non_sen_number" {
  type = number
}

variable "non_sen_obj" {
  type = map(string)
}

variable "non_sen_set" {
  type = set(string)
}

variable "non_sen_str" {
  type = string
}