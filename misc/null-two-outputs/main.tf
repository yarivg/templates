#terraform {
#  required_version = "1.5.7"
#  cloud {
#    hostname     = "backend-dev.api.dev.env0.com"
#    organization = "78036610-4c0d-448f-a440-81c4b9eb1d83.85828623-32df-4cf9-80a8-9aedbd1b7dbc"
#    workspaces {
#      name = "remote-backend-testing"
#    }
#  }
#}

resource "null_resource" "null4" {
}

#output "cluster_certificate_authority_data" {
#  value = "LS0tLS1CRUdJTiBDRVJUSUZJQ0FURS0tLS0tCk1JSURCVENDQWUyZ0F3SUJBZ0lJUXc5ZDlOdFFTcTR3RFFZSktvWklodmNOQVFFTEJRQXdGVEVUTUJFR0ExVUUKQXhNS2EzVmlaWEp1WlhSbGN6QWVGdzB5TkRBNU1UY3hPRFE1TlROYUZ3MHpOREE1TVRVeE9EVTBOVE5hTUJVeApFekFSQmdOVkJBTVRDbXQxWW1WeWJtVjBaWE13Z2dFaU1BMEdDU3FHU0liM0RRRUJBUVVBQTRJQkR3QXdnZ0VLCkFvSUJBUUNzVXZLRjZIYnMweWZkYjVpNmg0dXh2U3JqL3NJNnM4QkMrSzQreHRpcDFMaXBhOXEwWFNYZGNQZGEKTHhqbjZnWTA1RlhwV2lMOE55ZlJidWJzSEdIaG1ZTFQ2cmVPUzloclNyMGNJWG05SGF0NXdJblhIZ0lhaElWRQp4S3hFNnV1VTEyVnRCQ3Z6L25IRFk4OXp1Q3g2Y2tzd0lpOFpRbEFXaGdkWTJ0UjJWbklIYzlVS0pRek9PaVpHCjRWRUJlTU56c0ZnRS81ZlFoVkN3czdTc2pYTkpzQlJ5M3R1RURJR2t1cVpnQ0piT3d1eVNOZkF2bVYrM3UrN24KZzM0RWppUHRSWTlZSGpmcTJkZTdzNmthM245c1lTSSsvUG8ySG9yZzk3dUFwOVdzbmRKNzd4amF2V3dEUTNQbQo1R09IMDJ5TWE5emNUam8wcDkvUXhOQzBXTWJYQWdNQkFBR2pXVEJYTUE0R0ExVWREd0VCL3dRRUF3SUNwREFQCkJnTlZIUk1CQWY4RUJUQURBUUgvTUIwR0ExVWREZ1FXQkJRSERETmViMmlwelV5OWtGUVlQVTNUY3dVWm1EQVYKQmdOVkhSRUVEakFNZ2dwcmRXSmxjbTVsZEdWek1BMEdDU3FHU0liM0RRRUJDd1VBQTRJQkFRQTM4MWFvRXRiMwpQaElWM0hLRmZTUWwwaGVKeUtQYWxUYURNSzhCa1J3dXkrVnlUZmlVd0ZSRFEyK3pseFBYeU9BUGFtNkdYWVpzCnFBSnFibjg3dStVeXpERGVGZnJoam0yMGcvSmFZWjUzKzRBdDBjRzI2RzNvaTZPWGw3Sm1mVGlZOGc5OCsrVHcKekhqYkoxZEdCbmZqL0llSyt3dm5SaFhKVnRjZGREcHp1NzN2TWc0dmZRL1pYSnBXSmg1TnNqZnovSWRCL1pnRgp1L3lldWxsdW1LMjZpajJ4YXVHdXJERFV4VHN1NGM3TE4ydGI0TmJ6NmRKbituY2ZsY0xPRDFoKzJNRkRqNVRsCkxSV0s0ekFPRTNvSmUzdnpRTnV1eERLZzZVWlh1bmR0ZG1pNGljbUMrbTE3SVpaWERwdkJhSXBlZmdtT0NRRVUKVEpha3RPWURERWFZCi0tLS0tRU5EIENFUlRJRklDQVRFLS0tLS0K"
#}
#
#output "cluster_endpoint" {
#  value = "https://9A73B91F0C752C9188031AC3652A896F.gr7.us-east-1.eks.amazonaws.com"
#}
#
#output "cluster_name" {
#  value = "nequi-prod-use1"
#}
#
#output "cluster_security_group_id" {
#  value = "sg-067dfc07075696cd0"
#}
#
#output "cluster_version" {
#  value = "1.26"
#}

output "fargate_profiles" {
  value = {
    "asd": "dsa"
  }
}

#output "oidc_provider" {
#  value = "oidc.eks.us-east-1.amazonaws.com/id/9A73B91F0C752C9188031AC3652A896F"
#}
#
#output "oidc_provider_arn" {
#  value = "arn:aws:iam::390403873886:oidc-provider/oidc.eks.us-east-1.amazonaws.com/id/9A73B91F0C752C9188031AC3652A896F"
#}
#
#output "profile" {
#  value = "eksmaster-nequi-prod-usa-api-workload"
#}
#
#output "region" {
#  value = "us-east-1"
#}