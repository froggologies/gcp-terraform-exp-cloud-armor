resource "google_compute_health_check" "tcp-port-3000" {
  project = google_project.main_project.project_id
  name    = "tcp-port-3000"

  tcp_health_check {
    port = 3000
  }
  log_config {
    enable = true
  }
}

resource "google_compute_backend_service" "backend-service" {
  project       = google_project.main_project.project_id
  protocol      = "HTTP"
  name          = "backend-service"
  health_checks = [google_compute_health_check.tcp-port-3000.id]
  port_name     = "http"

  backend {
    group = google_compute_instance_group_manager.instance-group-manager-1.instance_group
  }
  log_config {
    enable = true
  }
}

resource "google_compute_url_map" "juice_shop_loadbalancer" {
  project = google_project.main_project.project_id
  name    = "juice-shop-loadbalancer"

  default_service = google_compute_backend_service.backend-service.id
}

resource "google_compute_target_http_proxy" "juice-shop-proxy" {

  name    = "juice-shop-proxy"
  url_map = google_compute_url_map.juice_shop_loadbalancer.id
}

resource "google_compute_global_forwarding_rule" "juice-shop-forwarding-rule" {
  project    = google_project.main_project.project_id
  name       = "juice-shop-forwarding-rule"
  port_range = "3000"
  target     = google_compute_target_http_proxy.juice-shop-proxy.id
}
