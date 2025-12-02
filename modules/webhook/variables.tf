variable "repository" {
  description = "The repository name."
  type        = string
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
