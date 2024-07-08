output "main_project_id" {
  value = module.projects[local.projects[0]].project_id
}

output "terraform_backend_bucket" {
  value = google_storage_bucket.state_backend.id
}
