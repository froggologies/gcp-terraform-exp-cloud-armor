resource "google_compute_health_check" "health-check1" {
  project = var.project_id
  name    = "health-check1"

  tcp_health_check {
    port_specification = "USE_SERVING_PORT"
  }

  check_interval_sec  = 10
  unhealthy_threshold = 3
}

resource "google_compute_backend_service" "backend-service" {
  project       = var.project_id
  protocol      = "HTTP"
  name          = "backend-service"
  health_checks = [google_compute_health_check.health-check1.id]
  port_name     = "http"

  backend {
    group           = google_compute_instance_group_manager.instance-group-manager-1.instance_group
    balancing_mode  = "UTILIZATION"
    max_utilization = 0.8
  }
  log_config {
    enable = true
  }

  security_policy = google_compute_security_policy.policy1.id
}

resource "google_compute_url_map" "juice_shop_loadbalancer" {
  project = var.project_id
  name    = "juice-shop-loadbalancer"

  default_service = google_compute_backend_service.backend-service.id
}

resource "google_compute_target_http_proxy" "juice-shop-proxy" {
  project = var.project_id
  name    = "juice-shop-proxy"
  url_map = google_compute_url_map.juice_shop_loadbalancer.id
}

resource "google_compute_global_forwarding_rule" "juice-shop-forwarding-rule" {
  project    = var.project_id
  name       = "juice-shop-forwarding-rule"
  port_range = "80"
  target     = google_compute_target_http_proxy.juice-shop-proxy.id
}
