variable "name" {
  description = "The name of the repository."
  type        = string
}

variable "description" {
  description = "The description of the repository."
  type        = string
  default     = null
}

variable "homepage_url" {
  description = "The homepage URL of the repository."
  type        = string
  default     = null
}

variable "visibility" {
  description = "The visibility of the repository (public, private, internal)."
  type        = string
  default     = "private"
}

variable "has_issues" {
  description = "Set to true to enable the GitHub Issues features on the repository."
  type        = bool
  default     = true
}

variable "has_projects" {
  description = "Set to true to enable the GitHub Projects features on the repository."
  type        = bool
  default     = false
}

variable "has_wiki" {
  description = "Set to true to enable the GitHub Wiki features on the repository."
  type        = bool
  default     = false
}

variable "allow_merge_commit" {
  description = "Set to true to enable merge commits on the repository."
  type        = bool
  default     = true
}

variable "allow_squash_merge" {
  description = "Set to true to enable squash merges on the repository."
  type        = bool
  default     = true
}

variable "allow_rebase_merge" {
  description = "Set to true to enable rebase merges on the repository."
  type        = bool
  default     = true
}

variable "delete_branch_on_merge" {
  description = "Automatically delete head branch after a pull request is merged."
  type        = bool
  default     = true
}

variable "auto_init" {
  description = "Set to true to produce an initial commit in the repository."
  type        = bool
  default     = true
}

variable "gitignore_template" {
  description = "Use the name of the template without the extension."
  type        = string
  default     = null
}

variable "license_template" {
  description = "Use the name of the template without the extension."
  type        = string
  default     = null
}

variable "topics" {
  description = "The list of topics of the repository."
  type        = list(string)
  default     = []
}

variable "vulnerability_alerts" {
  description = "Set to true to enable security alerts for vulnerable dependencies."
  type        = bool
  default     = true
}

variable "archive_on_destroy" {
  description = "Set to true to archive the repository instead of deleting on destroy."
  type        = bool
  default     = true
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

variable "collaborators" {
  description = "List of collaborators."
  type = list(object({
    username   = string
    permission = string # pull, push, admin, maintain, triage
  }))
  default = []
}

variable "webhooks" {
  description = "List of webhooks."
  type = list(object({
    url          = string
    content_type = string
    secret       = optional(string)
    insecure_ssl = optional(bool, false)
    events       = list(string)
    active       = optional(bool, true)
  }))
  default = []
}

variable "deploy_keys" {
  description = "List of deploy keys."
  type = list(object({
    title     = string
    key       = string
    read_only = bool
  }))
  default = []
}


