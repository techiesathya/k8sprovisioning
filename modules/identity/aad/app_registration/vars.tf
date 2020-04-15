variable "name" {
  type = string
}

variable "homepage" {
  type    = string
  default = "https://homepage"
}

variable "identifier_uris" {
  type    = list
  default = ["https://uri"]
}

variable "reply_urls" {
  type    = list
  default = ["https://replyurl"]
}

