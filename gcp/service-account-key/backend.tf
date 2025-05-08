terraform {
  cloud {
    hostname     = "backend-dev.api.dev.env0.com"
    organization = "63c723d4-5a73-491e-b187-ad4963914c46.ac24a4b7-22b6-4d40-a916-5e210c18dd6d"
    workspaces {
      name = "gcp-remote-run"
    }
  }
}