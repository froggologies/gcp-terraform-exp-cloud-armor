terraform {
  backend "gcs" {
    bucket = "state-backend-48d633"
    prefix = "terraform/projects/gcp-terraform-exp-cloud-armor"
  }
}
