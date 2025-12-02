resource "github_repository_webhook" "this" {
  for_each = { for webhook in var.webhooks : webhook.url => webhook }

  repository = var.repository

  configuration {
    url          = each.value.url
    content_type = each.value.content_type
    secret       = each.value.secret
    insecure_ssl = each.value.insecure_ssl
  }

  events = each.value.events
  active = each.value.active
}
