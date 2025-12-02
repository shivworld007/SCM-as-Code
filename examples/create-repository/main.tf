module "repository" {
  source = "../../modules/repository"

  name        = "example-repo-terraform"
  description = "An example repository managed by Terraform."
  visibility  = "public"
  topics      = ["terraform", "example"]

  branch_protection_rules = [
    {
      pattern                = "main"
      enforce_admins         = true
      required_pull_request_reviews = {
        dismiss_stale_reviews           = true
        restrict_dismissals             = false
        dismissal_restrictions          = []
        pull_request_bypassers          = []
        require_code_owner_reviews      = false
        required_approving_review_count = 1
      }
    }
  ]

  webhooks = [
    {
      url          = "https://example.com/webhook"
      content_type = "json"
      events       = ["push"]
    }
  ]

  deploy_keys = [
    {
      title     = "test-deploy-key"
      key       = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIEbqhHI13T3kD+DbdSapTW2vPCofoW2EuhXN/kFSWueF test@example.com"
      read_only = true
    }
  ]
}

# module "team" {
#   source = "../../modules/team"
#
#   name        = "example-team-terraform"
#   description = "An example team managed by Terraform."
#   privacy     = "closed"
#
#   members = [
#     # { username = "some-user", role = "member" } 
#   ]
#
#   repositories = [
#     {
#       repository = module.repository.repository_name
#       permission = "push"
#     }
#   ]
# }

# module "runner_group" {
#   source = "../../modules/runner_group"
#
#   name                    = "example-runner-group"
#   visibility              = "selected"
#   selected_repository_ids = [module.repository.repository_id]
# }
