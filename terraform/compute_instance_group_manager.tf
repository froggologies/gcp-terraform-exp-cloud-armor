resource "google_compute_instance_group_manager" "instance-group-manager-1" {
  version {
    name              = "primary"
    instance_template = google_compute_instance_template.instance-template-1.id
  }

  project            = google_project.main_project.project_id
  name               = "juice-shop-managed-group"
  base_instance_name = "juice-shop"
  zone               = "us-central1-a"
  target_size        = "1"

  named_port {
    name = "http"
    port = 3000
  }
}
