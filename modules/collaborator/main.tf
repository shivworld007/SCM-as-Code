resource "github_repository_collaborator" "this" {
  for_each = { for collaborator in var.collaborators : collaborator.username => collaborator }

  repository = var.repository
  username   = each.value.username
  permission = each.value.permission
}
