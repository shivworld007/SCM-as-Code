variable "team_id" {
  description = "The ID of the team."
  type        = string
}

variable "repositories" {
  description = "List of repositories to grant the team access to."
  type = list(object({
    repository = string
    permission = string # pull, push, admin, maintain, triage
  }))
  default = []
}
