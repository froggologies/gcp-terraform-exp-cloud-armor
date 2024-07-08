resource "google_compute_firewall" "default-allow-icmp" {
  network = google_compute_network.default.name
  project = var.project_id

  description = "Allows ICMP connections from any source to any instance on the network."

  name          = "default-allow-icmp"
  priority      = 65534
  source_ranges = ["0.0.0.0/0"]

  allow {
    protocol = "icmp"
  }
}

resource "google_compute_firewall" "default-allow-rdp" {
  network = google_compute_network.default.name
  project = var.project_id

  description = "Allows RDP connections from any source to any instance on the network using port 3389."

  name          = "default-allow-rdp"
  priority      = 65534
  source_ranges = ["0.0.0.0/0"]

  allow {
    protocol = "tcp"
    ports    = ["3389"]
  }
}

resource "google_compute_firewall" "default-allow-ssh" {
  network = google_compute_network.default.name
  project = var.project_id

  description = "Allows TCP connections from any source to any instance on the network using port 22."

  name          = "default-allow-ssh"
  priority      = 65534
  source_ranges = ["0.0.0.0/0"]

  allow {
    protocol = "tcp"
    ports    = ["22"]
  }
}

resource "google_compute_firewall" "default-allow-internal" {
  network = google_compute_network.default.name
  project = var.project_id

  description = "Allows TCP connections from any source to any instance on the network using port 22."

  name          = "default-allow-internal"
  priority      = 65534
  source_ranges = ["10.128.0.0/9"]

  allow {
    protocol = "tcp"
    ports    = ["0-65535"]
  }
  allow {
    protocol = "udp"
    ports    = ["0-65535"]
  }
  allow {
    protocol = "icmp"
  }
}

resource "google_compute_firewall" "web" {
  network     = google_compute_network.default.name
  project     = var.project_id
  description = "Allows TCP connections from any source to any instance on the network using port 3000, 80 and 443."

  name          = "web"
  source_ranges = ["0.0.0.0/0"]

  allow {
    protocol = "tcp"
    ports    = ["80", "443", "3000"]
  }

  target_tags = ["web"]
}

resource "google_compute_firewall" "allow-healthcheck" {
  network     = google_compute_network.default.name
  project     = var.project_id
  description = ""

  name          = "allow-healthcheck"
  source_ranges = ["130.211.0.0/22", "35.191.0.0/16"]

  allow {
    protocol = "tcp"
  }

  target_tags = ["allow-healthcheck"]
}
