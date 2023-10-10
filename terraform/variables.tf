variable "pm_api_url" {
  type = string
}

variable "pm_api_token_id" {
  type = string
}

variable "pm_api_token_secret" {
  type = string
}

variable "ssh_key" {
  type = string
}

variable "proxmox_host" {
  type    = string
  default = "hera"
}

variable "template_name" {
  type    = string
  default = "debian-12-cloud-init"
}
