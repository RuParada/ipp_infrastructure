resource "vercel_project" "ipp" {
  name = var.project_name
  framework = "gatsby"
}