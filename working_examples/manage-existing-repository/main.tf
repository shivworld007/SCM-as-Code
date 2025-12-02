data "github_repository" "existing" {
  full_name = "${var.github_owner}/${var.existing_repo_name}"
}

module "branch_protection" {
  source = "../../modules/branch_protection"

  repository_id = data.github_repository.existing.node_id

  branch_protection_rules = [
    {
      pattern                = "main"
      enforce_admins         = true
      required_pull_request_reviews = {
        dismiss_stale_reviews           = true
        restrict_dismissals             = false
        dismissal_restrictions          = []
        pull_request_bypassers          = []
        require_code_owner_reviews      = true
        required_approving_review_count = 2
      }
    }
  ]
}
