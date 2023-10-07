variable "server_count" {
  type    = number
  default = 1
}

variable "agent_count" {
  type    = number
  default = 0
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

variable "node_disk_size" {
  type    = string
  default = "40G"
}
