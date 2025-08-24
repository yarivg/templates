# S3 Bucket Public Access Test - OPA Policy Validation

This Terraform configuration creates AWS S3 buckets with intentionally insecure configurations to test OPA (Open Policy Agent) policies that should block public S3 bucket access.

## Purpose

This template is designed to validate that OPA policies correctly identify and deny the following S3 security violations:

1. **Public-read ACL** - S3 buckets with ACL set to "public-read"
2. **Public-read-write ACL** - S3 buckets with ACL set to "public-read-write"  
3. **Wildcard Principal Policies** - S3 bucket policies with Principal "*" and Effect "Allow"

## Resources Created

### Buckets That Should Be DENIED by OPA:

- **`public_read_bucket`** - Has ACL set to "public-read"
- **`public_read_write_bucket`** - Has ACL set to "public-read-write"
- **`public_policy_bucket`** - Has bucket policy with Principal "*" and Effect "Allow"
- **`another_public_policy_bucket`** - Has bucket policy with Principal AWS "*" and Effect "Allow"

### Secure Bucket (Should Be ALLOWED):

- **`secure_bucket`** - Demonstrates proper security practices:
  - Private ACL
  - Public access block enabled
  - Specific principal in bucket policy (not wildcard)

## Usage

1. **Initialize Terraform:**
   ```bash
   terraform init
   ```

2. **Plan the deployment:**
   ```bash
   terraform plan
   ```
   
   **Expected Result:** If OPA policies are properly configured, the plan should be **DENIED** due to the public S3 configurations.

3. **Apply (only if testing without OPA):**
   ```bash
   terraform apply
   ```

## Configuration

- **AWS Region:** Configurable via `aws_region` variable (default: us-east-1)
- **Bucket Names:** Include random suffixes to avoid naming conflicts
- **Tags:** All resources are properly tagged for identification

## Security Notes

⚠️ **WARNING:** This configuration intentionally creates insecure S3 buckets for testing purposes. Do NOT use these configurations in production environments.

The secure bucket example demonstrates proper S3 security practices:
- Private ACL
- Public access blocked
- Specific IAM principals instead of wildcards

## Expected OPA Policy Behavior

When integrated with OPA policies, running `terraform plan` should result in policy violations for the public bucket configurations, preventing the insecure resources from being created.
