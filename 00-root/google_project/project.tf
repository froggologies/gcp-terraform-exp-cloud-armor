resource "google_project" "default" {
  name            = var.project_name
  project_id      = "${var.project_name}-${random_id.project_suffix.hex}"
  folder_id       = var.folder_id
  billing_account = var.billing_account
}
