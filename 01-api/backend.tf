terraform {
  backend "gcs" {
    bucket = "state-backend-exp-cloud-armor-03dfaf"
    prefix = "terraform/api"
  }
}
