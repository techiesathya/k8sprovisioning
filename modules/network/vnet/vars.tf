variable "tags" {
  description = "Default Tags"
  type        = map(string)
}

variable "resource_group_name" {
  description = "Resource Group Name"
  type        = string
}

variable "address_space" {
  description = "Address space"
  type        = list(string)
}

variable "name" {
  description = "VNet Name"
}

variable "location" {
  type = string
}
