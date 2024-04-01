resource "google_service_account" "instance-1" {
  project    = google_project.main_project.project_id
  account_id = "instance-1"
}
