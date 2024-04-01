resource "google_project" "main_project" {
  name            = "exp-elastic"
  project_id      = "exp-elastic-${random_id.main_project.hex}"
  folder_id       = var.folder_id
  billing_account = var.billing_account
}
