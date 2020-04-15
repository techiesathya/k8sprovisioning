variable "primary_location" {
  type = string
}

variable "secondary_location" {
  type = string
}

variable "stage" {
  type = string
}
variable "application_name" {
  type = string
}

variable "subscription_id" {
  type = string
}

variable "tenant_id" {
  type = string
}

locals {
  default_tags = merge({ "Application" = var.application_name, "Stage" = var.stage })
}

