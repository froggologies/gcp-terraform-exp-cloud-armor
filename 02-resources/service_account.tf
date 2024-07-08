resource "google_service_account" "instance-1" {
  project    = var.project_id
  account_id = "instance-1"
}
