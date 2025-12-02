output "repository_name" {
  description = "The name of the repository."
  value       = github_repository.this.name
}

output "repository_full_name" {
  description = "The full name of the repository."
  value       = github_repository.this.full_name
}

output "repository_html_url" {
  description = "The URL to the repository."
  value       = github_repository.this.html_url
}

output "repository_ssh_clone_url" {
  description = "The SSH clone URL."
  value       = github_repository.this.ssh_clone_url
}

output "repository_http_clone_url" {
  description = "The HTTP clone URL."
  value       = github_repository.this.http_clone_url
}

output "repository_node_id" {
  description = "The node ID of the repository."
  value       = github_repository.this.node_id
}

output "repository_id" {
  description = "The ID of the repository."
  value       = github_repository.this.repo_id
}
