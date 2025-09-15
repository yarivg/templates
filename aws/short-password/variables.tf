variable "aws_region" {
  description = "AWS region for resources"
  type        = string
  default     = "us-east-1"
}

variable "password_length" {
  description = "Minimum password length for the AWS account password policy"
  type        = number
  default     = 8
}