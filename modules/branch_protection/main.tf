resource "github_branch_protection" "this" {
  for_each = { for rule in var.branch_protection_rules : rule.pattern => rule }

  repository_id = var.repository_id
  pattern       = each.value.pattern

  enforce_admins      = each.value.enforce_admins
  allows_deletions    = each.value.allows_deletions
  allows_force_pushes = each.value.allows_force_pushes

  dynamic "required_status_checks" {
    for_each = each.value.required_status_checks != null ? [each.value.required_status_checks] : []
    content {
      strict   = required_status_checks.value.strict
      contexts = required_status_checks.value.contexts
    }
  }

  dynamic "required_pull_request_reviews" {
    for_each = each.value.required_pull_request_reviews != null ? [each.value.required_pull_request_reviews] : []
    content {
      dismiss_stale_reviews           = required_pull_request_reviews.value.dismiss_stale_reviews
      restrict_dismissals             = required_pull_request_reviews.value.restrict_dismissals
      dismissal_restrictions          = required_pull_request_reviews.value.dismissal_restrictions
      pull_request_bypassers          = required_pull_request_reviews.value.pull_request_bypassers
      require_code_owner_reviews      = required_pull_request_reviews.value.require_code_owner_reviews
      required_approving_review_count = required_pull_request_reviews.value.required_approving_review_count
    }
  }

  dynamic "restrict_pushes" {
    for_each = length(each.value.push_restrictions) > 0 ? [1] : []
    content {
      push_allowances = each.value.push_restrictions
    }
  }
}
