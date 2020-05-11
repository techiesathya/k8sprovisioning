variable "resource_group_name" {
  description = "Resource Group Name"
  type        = string
}

variable "address_space" {
  description = "Address space"
  type        = list(string)
}

variable "name" {
  description = "Virtual network gateway name"
}

variable "gateway_public_ip_id" {
  description = "Virtual gateway public ip id"
}

variable "location" {
  description = "location"
}

variable "subnet_id" {
  description = "Subbet ID"
}

variable "gw_public_cert_data" {
  description = "pulic certificate"
}
