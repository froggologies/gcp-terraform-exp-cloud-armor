resource "google_project" "main_project" {
  name            = "exp-cloud-armor"
  project_id      = "exp-cloud-armor-${random_id.main_project.hex}"
  folder_id       = var.folder_id
  billing_account = var.billing_account
}
