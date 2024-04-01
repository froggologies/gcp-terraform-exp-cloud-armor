resource "google_compute_instance" "instance-1" {
  depends_on = [google_project_service.services.0]

  project = google_project.main_project.project_id
  name    = "instance-1"

  machine_type = "e2-micro"
  zone         = "us-central1-a"

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-11"
      size  = 10
      type  = "pd-standard"
    }
  }

  network_interface {
    network    = google_compute_network.default.id
    subnetwork = google_compute_subnetwork.us-central1.id
    access_config {
      network_tier = "STANDARD"
    }
  }

  metadata_startup_script = <<-SCRIPT
    #!/bin/bash
    apt-get update
    apt-get install -y nginx
    service nginx start
  SCRIPT

  service_account {
    email  = google_service_account.instance-1.email
    scopes = ["cloud-platform"]
  }
}
