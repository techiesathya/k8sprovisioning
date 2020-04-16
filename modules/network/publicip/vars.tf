variable "public_ip_name" {
  type = string
}

variable "resource_group_name" {
  type = string
}

variable "location" {
  type = string
}

variable "allocation_method" {
  default = "Static"
}

variable "tags" {
  type = map(string)
}
