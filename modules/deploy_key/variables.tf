variable "repository" {
  description = "The repository name."
  type        = string
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
