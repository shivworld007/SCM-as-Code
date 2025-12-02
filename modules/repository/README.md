# Repository Module

This module manages a GitHub repository and its associated resources, such as branch protection rules, webhooks, and collaborators.

## Usage

### Basic Repository

```hcl
module "repository" {
  source = "./modules/repository"

  name        = "my-repo"
  description = "My awesome repository"
  visibility  = "private"
}
```

### Repository with Branch Protection

You can define branch protection rules directly within the module call using the `branch_protection_rules` variable. This allows you to manage the repository and its policies in a single block.

```hcl
module "repository" {
  source = "./modules/repository"

  name = "secure-repo"
  # ...

  branch_protection_rules = [
    {
      pattern                = "main"
      enforce_admins         = true
      allows_deletions       = false
      
      required_status_checks = {
        strict   = true
        contexts = ["ci/test", "ci/lint"]
      }

      required_pull_request_reviews = {
        dismiss_stale_reviews           = true
        restrict_dismissals             = true
        dismissal_restrictions          = [] # List of users/teams
        pull_request_bypassers          = []
        require_code_owner_reviews      = true
        required_approving_review_count = 1
      }
    }
  ]
}
```

### Adding Webhooks

```hcl
module "repository" {
  # ...
  webhooks = [
    {
      url          = "https://example.com/webhook"
      content_type = "json"
      events       = ["push", "pull_request"]
    }
  ]
}
```
