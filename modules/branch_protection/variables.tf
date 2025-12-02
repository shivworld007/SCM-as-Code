variable "repository_id" {
  description = "The ID or node ID of the repository."
  type        = string
}

variable "branch_protection_rules" {
  description = "List of branch protection rules."
  type = list(object({
    pattern             = string
    enforce_admins      = bool
    allows_deletions    = optional(bool, false)
    allows_force_pushes = optional(bool, false)
    required_status_checks = optional(object({
      strict   = bool
      contexts = list(string)
    }), null)
    required_pull_request_reviews = optional(object({
      dismiss_stale_reviews           = bool
      restrict_dismissals             = bool
      dismissal_restrictions          = list(string)
      pull_request_bypassers          = list(string)
      require_code_owner_reviews      = bool
      required_approving_review_count = number
    }), null)
    push_restrictions = optional(list(string), [])
  }))
  default = []
}
