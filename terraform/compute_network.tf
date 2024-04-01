resource "google_compute_network" "default" {
  depends_on = [google_project_service.services]

  project                 = google_project.main_project.project_id
  name                    = "default"
  auto_create_subnetworks = false
}

resource "google_compute_subnetwork" "us-central1" {
  project       = google_project.main_project.project_id
  name          = "default"
  region        = "us-central1"
  ip_cidr_range = "10.128.0.0/20"
  network       = google_compute_network.default.id
}
