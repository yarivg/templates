terraform {
  required_providers {
    null = {
      source  = "hashicorp/null"
      version = "~> 3.0"
    }
  }
}

resource "null_resource" "resource_1" {
  triggers = {
    module = "module-03"
    index  = "1"
  }
}

resource "null_resource" "resource_2" {
  triggers = {
    module = "module-03"
    index  = "2"
  }
}

resource "null_resource" "resource_3" {
  triggers = {
    module = "module-03"
    index  = "3"
  }
}

resource "null_resource" "resource_4" {
  triggers = {
    module = "module-03"
    index  = "4"
  }
}

resource "null_resource" "resource_5" {
  triggers = {
    module = "module-03"
    index  = "5"
  }
}

resource "null_resource" "resource_6" {
  triggers = {
    module = "module-03"
    index  = "6"
  }
}

resource "null_resource" "resource_7" {
  triggers = {
    module = "module-03"
    index  = "7"
  }
}

resource "null_resource" "resource_8" {
  triggers = {
    module = "module-03"
    index  = "8"
  }
}

resource "null_resource" "resource_9" {
  triggers = {
    module = "module-03"
    index  = "9"
  }
}

resource "null_resource" "resource_10" {
  triggers = {
    module = "module-03"
    index  = "10"
  }
}

