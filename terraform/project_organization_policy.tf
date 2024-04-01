locals {
  restore_policies = [
    "compute.vmExternalIpAccess",
    "compute.requireOsLogin"
  ]
}

resource "google_project_organization_policy" "restore_policies" {
  for_each   = toset(local.restore_policies)
  project    = google_project.main_project.project_id
  constraint = each.value

  restore_policy {
    default = true
  }
}
