package env0

import rego.v1

deny contains msg if {
	some rc in input.plan.resource_changes
	rc.type == "aws_s3_bucket_acl"
	a := rc.change.after
	a.acl == "public-read"
	msg := sprintf("%s: public S3 bucket ACL (%s)", [rc.address, a.acl])
}

deny contains msg if {
	some rc in input.plan.resource_changes
	rc.type == "aws_s3_bucket_acl"
	a := rc.change.after
	a.acl == "public-read-write"
	msg := sprintf("%s: public S3 bucket ACL (%s)", [rc.address, a.acl])
}

deny contains msg if {
	some rc in input.plan.resource_changes
	rc.type == "aws_s3_bucket_policy"
	a := rc.change.after
	pol := json.unmarshal(a.policy)
	some st in pol.Statement
	lower(st.Effect) == "allow"
	wildcard_principal_check(st.Principal)
	msg := sprintf("%s: bucket policy allows public access", [rc.address])
}

deny contains msg if {
	some r in input.plan.resource_changes
	r.type == "aws_s3_bucket_public_access_block"
	r.change.after.block_public_acls != true
	msg := sprintf("%s: S3 bucket must enable 'block_public_acls'", [r.address])
}

deny contains msg if {
	some r in input.plan.resource_changes
	r.type == "aws_s3_bucket_public_access_block"
	r.change.after.block_public_policy != true
	msg := sprintf("%s: S3 bucket must enable 'block_public_policy'", [r.address])
}

deny contains msg if {
	some r in input.plan.resource_changes
	r.type == "aws_s3_bucket_public_access_block"
	r.change.after.ignore_public_acls != true
	msg := sprintf("%s: S3 bucket must enable 'ignore_public_acls'", [r.address])
}

deny contains msg if {
	some r in input.plan.resource_changes
	r.type == "aws_s3_bucket_public_access_block"
	r.change.after.restrict_public_buckets != true
	msg := sprintf("%s: S3 bucket must enable 'restrict_public_buckets'", [r.address])
}

allow contains "No public S3 bucket violations found" if {
	count(deny) == 0
}

wildcard_principal_check(prin) if {
	prin == "*"
}

wildcard_principal_check(prin) if {
	is_object(prin)
	prin.AWS == "*"
}

wildcard_principal_check(prin) if {
	is_array(prin)
	some p in prin
	p == "*"
}
