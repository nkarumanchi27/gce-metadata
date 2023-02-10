variable "gcp_project_ids" {
  description = "Names of google clod projects"
  type = object({
    web: optional(string)
    data: optional(string)
    gke: optional(string)
  })
}

/*resource "google_compute_Project_metadata" "default_metadata"{
  for_each = var.gcp_project_ids
  project = each.value.web
  metadata = {
  enable-oslogin = "TRUE"
  }
}*/

resource "google_compute_project_metadata" "default" {
  #for_each = {for k, v in var.gcp_project_ids : k => v if v is not null}
  for_each = {for k, v in var.gcp_project_ids : k => v if v != ""}

  project = each.value
  metadata = {
    enable-oslogin = "TRUE"
  }
}

/*output "web_project_display_names" {
  value = google_compute_project_metadata.default.*.metadata["display-name"]
}*/
