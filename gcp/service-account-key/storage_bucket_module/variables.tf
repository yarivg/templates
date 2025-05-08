variable "bucket_name" {
  description = "The name of the storage bucket"
  type        = string
}

variable "location" {
  description = "The location of the storage bucket"
  type        = string
  default     = "US"
}

variable "project_id" {
  description = "The GCP project id"
  type        = string
}