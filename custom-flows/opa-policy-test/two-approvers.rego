package policy.require_two_approvers

default allow = false

# Require at least 2 approvers for a deploy request
allow {
  input.deploymentRequest.type == "deploy"
  input.approvers
  count(input.approvers) >= 2
}

# Helper function to count items in a list
count(list) = n {
  n := count(list)
}