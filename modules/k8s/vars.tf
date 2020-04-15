variable "name" {
  type = string
}

variable "location" {
  type = string
}

variable "resource_group_name" {
  type = string
}

# Node pool variables
variable "availability_zones" {
  type    = list
  default = []
}

variable "enable_auto_scaling" {
  type    = bool
  default = false
}

variable "enable_node_public_ip" {
  type    = bool
  default = false
}

variable "max_pods" {
  type    = number
  default = 110
}

variable "node_poolname" {
  type = string
}

variable "node_count" {
  type    = number
  default = 2
}

variable "node_taints" {
  type    = list
  default = []
}

variable "os_disk_size" {
  type    = number
  default = 30
}

variable "vm_size" {
  type    = string
  default = "Standard_B2s"
}

variable "service_principal_client_id" {
  type = string
}

variable "service_principal_client_secret" {
  type = string
}

variable "tags" {
  type = map(string)
}

