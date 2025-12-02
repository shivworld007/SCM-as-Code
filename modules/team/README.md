# Team Module

This module manages a GitHub Team, its membership, and its repository access.

> **Note**: This module requires a GitHub Organization. It will not work with individual user accounts.

## Usage

```hcl
module "team" {
  source = "../../modules/team"

  name        = "my-team"
  description = "My awesome team"
  privacy     = "closed"

  members = [
    { username = "user1", role = "maintainer" },
    { username = "user2", role = "member" }
  ]

  repositories = [
    {
      repository = "my-repo"
      permission = "push"
    }
  ]
}
```

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| `name` | The name of the team. | `string` | n/a | yes |
| `description` | The description of the team. | `string` | `null` | no |
| `privacy` | The level of privacy for the team (secret, closed). | `string` | `"closed"` | no |
| `parent_team_id` | The ID of the parent team, if any. | `string` | `null` | no |
| `members` | List of members to add to the team. | `list(object)` | `[]` | no |
| `repositories` | List of repositories to grant access to. | `list(object)` | `[]` | no |

## Outputs

| Name | Description |
|------|-------------|
| `team_id` | The ID of the team. |
| `team_slug` | The slug of the team. |
| `team_name` | The name of the team. |
