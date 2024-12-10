package policy.require_two_approvers

default allow = false

# Require at least 2 approvers for a deploy request
allow {
  input.deploymentRequest.type == "deploy"
  count(input.approvers) >= 2
}