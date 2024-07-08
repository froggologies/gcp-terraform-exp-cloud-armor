terraform {
  backend "gcs" {
    bucket = "state-backend-exp-cloud-armor-160969"
    prefix = "terraform/api"
  }
}
