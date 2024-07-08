terraform {
  required_version = "~>1.8.0"
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "~>5.0"
    }
    random = {
      source  = "hashicorp/random"
      version = "~>3.0"
    }
  }
}
