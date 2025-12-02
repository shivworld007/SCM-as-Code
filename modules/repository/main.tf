resource "github_repository" "this" {
  name                   = var.name
  description            = var.description
  homepage_url           = var.homepage_url
  visibility             = var.visibility
  has_issues             = var.has_issues
  has_projects           = var.has_projects
  has_wiki               = var.has_wiki
  allow_merge_commit     = var.allow_merge_commit
  allow_squash_merge     = var.allow_squash_merge
  allow_rebase_merge     = var.allow_rebase_merge
  delete_branch_on_merge = var.delete_branch_on_merge
  auto_init              = var.auto_init
  gitignore_template     = var.gitignore_template
  license_template       = var.license_template
  topics                 = var.topics
  vulnerability_alerts   = var.vulnerability_alerts
  archive_on_destroy     = var.archive_on_destroy
}

module "branch_protection" {
  source = "../branch_protection"

  repository_id           = github_repository.this.node_id
  branch_protection_rules = var.branch_protection_rules
}

module "collaborators" {
  source = "../collaborator"

  repository    = github_repository.this.name
  collaborators = var.collaborators
}

module "webhooks" {
  source = "../webhook"

  repository = github_repository.this.name
  webhooks   = var.webhooks
}

module "deploy_keys" {
  source = "../deploy_key"

  repository  = github_repository.this.name
  deploy_keys = var.deploy_keys
}


