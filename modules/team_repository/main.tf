resource "github_team_repository" "this" {
  for_each = { for repo in var.repositories : repo.repository => repo }

  team_id    = var.team_id
  repository = each.value.repository
  permission = each.value.permission
}
