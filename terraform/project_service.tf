locals {
  services = [
    "compute.googleapis.com",
    "container.googleapis.com"
  ]
}

resource "google_project_service" "services" {
  for_each = toset(local.services)

  project = google_project.main_project.project_id
  service = each.value

  disable_dependent_services = true
}
