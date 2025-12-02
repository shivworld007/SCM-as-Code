variable "repository" {
  description = "The repository name."
  type        = string
}

variable "collaborators" {
  description = "List of collaborators."
  type = list(object({
    username   = string
    permission = string # pull, push, admin, maintain, triage
  }))
  default = []
}
