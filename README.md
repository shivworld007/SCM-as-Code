# GitHub Terraform Modules

A collection of reusable Terraform modules for managing GitHub resources as code.

## Modules

| Module | Description | Individual Account | Organization Account |
| :--- | :--- | :---: | :---: |
| [`repository`](./modules/repository) | Manages repositories, branch protection, webhooks, keys. | ✅ | ✅ |
| [`branch_protection`](./modules/branch_protection) | Manages branch protection rules. | ✅ | ✅ |
| [`webhook`](./modules/webhook) | Manages repository webhooks. | ✅ | ✅ |
| [`deploy_key`](./modules/deploy_key) | Manages deploy keys. | ✅ | ✅ |
| [`collaborator`](./modules/collaborator) | Manages repository collaborators. | ✅ | ✅ |
| [`team`](./modules/team) | Manages teams and memberships. | ❌ | ✅ |
| [`team_membership`](./modules/team_membership) | Manages team members. | ❌ | ✅ |
| [`team_repository`](./modules/team_repository) | Manages team repository access. | ❌ | ✅ |
| [`runner_group`](./modules/runner_group) | Manages self-hosted runner groups. | ❌ | ✅ |

## Usage

### Repository (Works for everyone)

```hcl
module "repository" {
  source = "./modules/repository"
  name   = "my-awesome-repo"
  # ...
}
```

### Team (Organization only)

```hcl
module "team" {
  source = "./modules/team"
  name   = "my-team"
  # ...
}
```

## Requirements

- Terraform >= 1.0
- `integrations/github` provider >= 6.0
