terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
    random = {
      source  = "hashicorp/random"
      version = "~> 3.1"
    }
  }
}

provider "aws" {
  region = var.aws_region
}

# Random suffix to avoid bucket naming conflicts
resource "random_id" "bucket_suffix" {
  byte_length = 8
}

# SCENARIO 1: S3 bucket with ACL set to "public-read"
# This should be DENIED by OPA policy
resource "aws_s3_bucket" "public_read_bucket" {
  bucket = "test-public-read-bucket-${random_id.bucket_suffix.hex}"

  tags = {
    Name        = "Public Read Test Bucket"
    Environment = "test"
    Purpose     = "OPA Policy Testing - Should be DENIED"
  }
}

resource "aws_s3_bucket_acl" "public_read_acl" {
  bucket = aws_s3_bucket.public_read_bucket.id
  acl    = "public-read"  # This will be DENIED by OPA policy
}

# SCENARIO 2: S3 bucket with ACL set to "public-read-write"
# This should be DENIED by OPA policy
resource "aws_s3_bucket" "public_read_write_bucket" {
  bucket = "test-public-read-write-bucket-${random_id.bucket_suffix.hex}"

  tags = {
    Name        = "Public Read-Write Test Bucket"
    Environment = "test"
    Purpose     = "OPA Policy Testing - Should be DENIED"
  }
}

resource "aws_s3_bucket_acl" "public_read_write_acl" {
  bucket = aws_s3_bucket.public_read_write_bucket.id
  acl    = "public-read-write"  # This will be DENIED by OPA policy
}

# SCENARIO 3: S3 bucket with policy that has Principal "*" with Effect "Allow"
# This should be DENIED by OPA policy
resource "aws_s3_bucket" "public_policy_bucket" {
  bucket = "test-public-policy-bucket-${random_id.bucket_suffix.hex}"

  tags = {
    Name        = "Public Policy Test Bucket"
    Environment = "test"
    Purpose     = "OPA Policy Testing - Should be DENIED"
  }
}

# Bucket policy with wildcard principal - This will be DENIED by OPA policy
resource "aws_s3_bucket_policy" "public_policy" {
  bucket = aws_s3_bucket.public_policy_bucket.id

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Sid       = "PublicReadGetObject"
        Effect    = "Allow"
        Principal = "*"  # Wildcard principal with Allow effect - DENIED by OPA
        Action    = "s3:GetObject"
        Resource  = "${aws_s3_bucket.public_policy_bucket.arn}/*"
      }
    ]
  })
}

# ADDITIONAL SCENARIO: Another bucket policy variant with wildcard principal
# This should also be DENIED by OPA policy
resource "aws_s3_bucket" "another_public_policy_bucket" {
  bucket = "test-another-public-policy-bucket-${random_id.bucket_suffix.hex}"

  tags = {
    Name        = "Another Public Policy Test Bucket"
    Environment = "test"
    Purpose     = "OPA Policy Testing - Should be DENIED"
  }
}

resource "aws_s3_bucket_policy" "another_public_policy" {
  bucket = aws_s3_bucket.another_public_policy_bucket.id

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Sid    = "AllowPublicRead"
        Effect = "Allow"
        Principal = {
          AWS = "*"  # Another way to specify wildcard principal - DENIED by OPA
        }
        Action   = ["s3:GetObject", "s3:ListBucket"]
        Resource = [
          aws_s3_bucket.another_public_policy_bucket.arn,
          "${aws_s3_bucket.another_public_policy_bucket.arn}/*"
        ]
      }
    ]
  })
}

# EXAMPLE OF SECURE BUCKET (should NOT be denied)
# This bucket demonstrates proper security practices
resource "aws_s3_bucket" "secure_bucket" {
  bucket = "test-secure-bucket-${random_id.bucket_suffix.hex}"

  tags = {
    Name        = "Secure Test Bucket"
    Environment = "test"
    Purpose     = "OPA Policy Testing - Should be ALLOWED"
  }
}

# Private ACL (should be allowed)
resource "aws_s3_bucket_acl" "secure_acl" {
  bucket = aws_s3_bucket.secure_bucket.id
  acl    = "private"
}

# Block all public access (recommended security practice)
resource "aws_s3_bucket_public_access_block" "secure_bucket_pab" {
  bucket = aws_s3_bucket.secure_bucket.id

  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}

# Secure bucket policy with specific principal (should be allowed)
resource "aws_s3_bucket_policy" "secure_policy" {
  bucket = aws_s3_bucket.secure_bucket.id

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Sid    = "AllowSpecificAccount"
        Effect = "Allow"
        Principal = {
          AWS = "arn:aws:iam::123456789012:root"  # Specific account, not wildcard
        }
        Action   = "s3:GetObject"
        Resource = "${aws_s3_bucket.secure_bucket.arn}/*"
      }
    ]
  })
}
