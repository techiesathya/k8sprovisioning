variable "domain_name" {
  description = "Domain name"
  type        = string
}

variable "tags" {
  description = "Default Tags"
  type        = map(string)
}

variable "resource_group_name" {
  description = "Resource Group Name"
  type        = string
}
