output "team_id" {
  description = "The ID of the team."
  value       = github_team.this.id
}

output "team_node_id" {
  description = "The node ID of the team."
  value       = github_team.this.node_id
}

output "team_slug" {
  description = "The slug of the team."
  value       = github_team.this.slug
}
