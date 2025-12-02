variable "name" {
  description = "Name of the runner group."
  type        = string
}

variable "visibility" {
  description = "The visibility of the runner group. (all, selected, private)"
  type        = string
  default     = "selected"
}

variable "selected_repository_ids" {
  description = "List of repository IDs that can access the runner group."
  type        = list(number)
  default     = []
}

variable "allows_public_repositories" {
  description = "Whether public repositories can be added to the runner group."
  type        = bool
  default     = false
}

variable "restricted_to_workflows" {
  description = "If true, the runner group will be restricted to running only the workflows specified in the selected_workflows list."
  type        = bool
  default     = false
}

variable "selected_workflows" {
  description = "List of workflows the runner group should be allowed to run. This setting is ignored unless restricted_to_workflows is set to true."
  type        = list(string)
  default     = []
}
