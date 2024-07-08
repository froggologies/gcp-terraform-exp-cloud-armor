resource "google_storage_bucket" "state_backend" {
  project       = module.projects[local.projects[0]].project_id
  name          = "state-backend-${module.projects[local.projects[0]].project_id}"
  location      = "ASIA-SOUTHEAST2"
  force_destroy = false

  uniform_bucket_level_access = true
}
