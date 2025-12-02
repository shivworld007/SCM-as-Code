terraform {
  required_providers {
    github = {
      source  = "integrations/github"
      version = "~> 6.0"
    }
  }
}

provider "github" {
  owner = var.github_owner
}

variable "github_owner" {
  description = "The GitHub organization or user name."
  type        = string
}

module "scm_as_code_repo" {
  source = "../modules/repository"

  name        = "SCM-as-Code"
  description = "Reusable Terraform modules for GitHub management."
  visibility  = "public"
  topics      = ["terraform", "github", "iac"]
  
  # Initialize with a README so we can pull/push easily
  auto_init = true 
}

output "repo_ssh_url" {
  value = module.scm_as_code_repo.repository_ssh_clone_url
}

output "repo_http_url" {
  value = module.scm_as_code_repo.repository_http_clone_url
}
