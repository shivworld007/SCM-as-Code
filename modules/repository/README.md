# Repository Module

This module manages a GitHub repository and its associated resources, including branch protection rules, webhooks, deploy keys, and collaborators.

## Usage

```hcl
module "repository" {
  source = "../../modules/repository"

  name        = "my-repo"
  description = "My awesome repository"
  visibility  = "private"

  branch_protection_rules = [
    {
      pattern                = "main"
      enforce_admins         = true
      required_pull_request_reviews = {
        required_approving_review_count = 1
      }
    }
  ]
}
```

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| `name` | The name of the repository. | `string` | n/a | yes |
| `description` | The description of the repository. | `string` | `null` | no |
| `visibility` | The visibility of the repository (public, private, internal). | `string` | `"private"` | no |
| `has_issues` | Enable GitHub Issues. | `bool` | `true` | no |
| `has_projects` | Enable GitHub Projects. | `bool` | `false` | no |
| `has_wiki` | Enable GitHub Wiki. | `bool` | `false` | no |
| `auto_init` | Produce an initial commit. | `bool` | `true` | no |
| `branch_protection_rules` | List of branch protection rules. | `list(object)` | `[]` | no |
| `webhooks` | List of webhooks. | `list(object)` | `[]` | no |
| `deploy_keys` | List of deploy keys. | `list(object)` | `[]` | no |
| `collaborators` | List of collaborators. | `list(object)` | `[]` | no |

## Outputs

| Name | Description |
|------|-------------|
| `repository_name` | The name of the repository. |
| `repository_full_name` | The full name of the repository. |
| `repository_html_url` | The URL to the repository. |
| `repository_ssh_clone_url` | The SSH clone URL. |
| `repository_http_clone_url` | The HTTP clone URL. |
| `repository_id` | The ID of the repository. |
