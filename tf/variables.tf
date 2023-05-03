variable "spa-app-bkt" {
  type        = string
  description = "Name of the bucket for holding SPA scripts"
  default     = "spa-app-x67672a"
}

variable "static-data-bkt" {
  type        = string
  description = "Name of the bucket for holding static files"
  default     = "spa-static-files-x67672a"
}

variable "s3_force_destroy" {
  type        = string
  description = "Destroy the s3 bucket inspite of contents in it."
  default     = true
}

variable "index_document" {
  type        = string
  description = "Index page to be used for website. Defaults to index.html"
  default     = "index.html"
}

variable "error_document" {
  type        = string
  description = "Error page to be used for website. Defaults to error.html"
  default     = "error.html"
}
