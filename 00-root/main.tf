locals {
  projects = ["exp-cloud-armor"]
}
module "projects" {
  for_each = toset(local.projects)

  source          = "./google_project"
  project_name    = each.value
  billing_account = var.billing_account
  folder_id       = var.folder_id
}
