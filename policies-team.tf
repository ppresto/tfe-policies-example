resource "tfe_policy_set" "platform" {
  name                   = "team-policies"
  description            = "Team Policies"
  organization           = "${var.tfe_organization}"
  policies_path          = "policies/team"
  workspace_external_ids = [
    "${local.workspaces["patspets_dev"]}",
    "${local.workspaces["patspets_stage"]}",
  ]

  vcs_repo {
    identifier         = "${var.repo_org}/tfe-policies-example"
    branch             = "master"
    ingress_submodules = false
    oauth_token_id     = "${var.oauth_token_id}"
  }
}