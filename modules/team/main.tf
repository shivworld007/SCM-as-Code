resource "github_team" "this" {
  name           = var.name
  description    = var.description
  privacy        = var.privacy
  parent_team_id = var.parent_team_id
}

module "members" {
  source = "../team_membership"

  team_id = github_team.this.id
  members = var.members
}

module "repositories" {
  source = "../team_repository"

  team_id      = github_team.this.id
  repositories = var.repositories
}
