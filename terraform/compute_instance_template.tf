resource "google_compute_instance_template" "instance-template-1" {
  project      = google_project.main_project.project_id
  name         = "juice-shop-template"
  machine_type = "e2-micro"

  tags = ["web", "allow-healthcheck"]

  disk {
    source_image = "cos-cloud/cos-stable"
    auto_delete  = true
    boot         = true
    disk_size_gb = 10
    disk_type    = "pd-standard"
  }

  network_interface {
    network    = google_compute_network.default.id
    subnetwork = google_compute_subnetwork.us-central1.id
  }

  scheduling {
    automatic_restart = true
  }

  metadata = {
    gce-container-declaration = <<-EOF
    spec:
      containers:
        - name: juice-shop
          image: docker.io/bkimminich/juice-shop
          stdin: false
          tty: false
      restartPolicy: Always
      # This container declaration format is not public API and may change without notice. Please
      # use gcloud command-line tool or Google Cloud Console to run Containers on Google Compute Engine.
    EOF
  }

  service_account {
    email  = google_service_account.instance-1.email
    scopes = ["cloud-platform"]
  }
}
