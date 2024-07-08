resource "google_compute_network" "default" {
  project                 = var.project_id
  name                    = "default"
  auto_create_subnetworks = false
}

resource "google_compute_subnetwork" "us-central1" {
  project       = var.project_id
  name          = "default"
  region        = "us-central1"
  ip_cidr_range = "10.128.0.0/20"
  network       = google_compute_network.default.id
}

resource "google_compute_router" "router" {
  project = var.project_id
  name    = "router"
  region  = google_compute_subnetwork.us-central1.region
  network = google_compute_network.default.id

  bgp {
    asn = 64514
  }
}

resource "google_compute_router_nat" "nat" {
  project                            = var.project_id
  name                               = "nat"
  router                             = google_compute_router.router.name
  region                             = google_compute_router.router.region
  nat_ip_allocate_option             = "AUTO_ONLY"
  source_subnetwork_ip_ranges_to_nat = "ALL_SUBNETWORKS_ALL_IP_RANGES"

  log_config {
    enable = true
    filter = "ERRORS_ONLY"
  }
}
