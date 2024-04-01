locals {
  google = [
    "roles/editor",
  ]
}

resource "google_project_iam_member" "google" {
  for_each = toset(local.google)

  project = google_project.main_project.project_id
  role    = each.value
  member  = "user:google@fajarmaftuhfadli.com"
}
