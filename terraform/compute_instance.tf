# resource "google_compute_instance" "instance-1" {
#   depends_on = [google_project_service.services.0]

#   project = google_project.main_project.project_id
#   name    = "instance-1"

#   machine_type = "e2-micro"
#   zone         = "us-central1-a"

#   boot_disk {
#     initialize_params {
#       image = "cos-cloud/cos-stable"
#       size  = 10
#       type  = "pd-standard"
#     }
#   }

#   network_interface {
#     network    = google_compute_network.default.id
#     subnetwork = google_compute_subnetwork.us-central1.id
#     access_config {
#       network_tier = "STANDARD"
#     }
#   }

#   tags = ["web"]

#   service_account {
#     email  = google_service_account.instance-1.email
#     scopes = ["cloud-platform"]
#   }
#   metadata = {
#     gce-container-declaration = <<-EOF
#     spec:
#       containers:
#         - name: juice-shop
#           image: docker.io/bkimminich/juice-shop
#           stdin: false
#           tty: false
#       restartPolicy: Always
#       # This container declaration format is not public API and may change without notice. Please
#       # use gcloud command-line tool or Google Cloud Console to run Containers on Google Compute Engine.
#     EOF
#   }
# }
