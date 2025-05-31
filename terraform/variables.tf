variable "vercel_token" {
  description = "vercel api token for authentication"
  type        = string
}

variable "project_name" {
  description = "name of the vercel project"
  type        = string
  default     = "ipp-vercel-project"
  
}