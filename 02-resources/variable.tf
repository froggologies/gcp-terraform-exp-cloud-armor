variable "project_id" {
  type = string
}

variable "crs_rules" {
  type = map(object({
    preview_mode = string
    action       = string
    priority     = string
    description  = string
    expression   = string
  }))
}
