variable "name" {
  description = "The name of the team."
  type        = string
}

variable "description" {
  description = "The description of the team."
  type        = string
  default     = null
}

variable "privacy" {
  description = "The level of privacy for the team. Must be one of secret or closed."
  type        = string
  default     = "closed"
}

variable "parent_team_id" {
  description = "The ID of the parent team, if this is a nested team."
  type        = string
  default     = null
}

variable "members" {
  description = "List of members to add to the team."
  type = list(object({
    username = string
    role     = optional(string, "member") # member or maintainer
  }))
  default = []
}

variable "repositories" {
  description = "List of repositories to grant the team access to."
  type = list(object({
    repository = string
    permission = string # pull, push, admin, maintain, triage
  }))
  default = []
}
