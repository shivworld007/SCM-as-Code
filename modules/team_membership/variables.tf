variable "team_id" {
  description = "The ID of the team."
  type        = string
}

variable "members" {
  description = "List of members to add to the team."
  type = list(object({
    username = string
    role     = optional(string, "member") # member or maintainer
  }))
  default = []
}
