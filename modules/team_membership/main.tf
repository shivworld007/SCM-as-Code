resource "github_team_membership" "this" {
  for_each = { for member in var.members : member.username => member }

  team_id  = var.team_id
  username = each.value.username
  role     = each.value.role
}
