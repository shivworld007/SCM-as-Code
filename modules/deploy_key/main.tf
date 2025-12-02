resource "github_repository_deploy_key" "this" {
  for_each = { for key in var.deploy_keys : key.title => key }

  repository = var.repository
  title      = each.value.title
  key        = each.value.key
  read_only  = each.value.read_only
}
