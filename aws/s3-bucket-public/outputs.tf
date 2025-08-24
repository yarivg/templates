output "public_read_bucket_name" {
  description = "Name of the bucket with public-read ACL (should be DENIED)"
  value       = aws_s3_bucket.public_read_bucket.bucket
}

output "public_read_write_bucket_name" {
  description = "Name of the bucket with public-read-write ACL (should be DENIED)"
  value       = aws_s3_bucket.public_read_write_bucket.bucket
}

output "public_policy_bucket_name" {
  description = "Name of the bucket with wildcard principal policy (should be DENIED)"
  value       = aws_s3_bucket.public_policy_bucket.bucket
}

output "another_public_policy_bucket_name" {
  description = "Name of another bucket with wildcard principal policy (should be DENIED)"
  value       = aws_s3_bucket.another_public_policy_bucket.bucket
}

output "secure_bucket_name" {
  description = "Name of the secure bucket (should be ALLOWED)"
  value       = aws_s3_bucket.secure_bucket.bucket
}

output "bucket_suffix" {
  description = "Random suffix used for bucket names"
  value       = random_id.bucket_suffix.hex
}
