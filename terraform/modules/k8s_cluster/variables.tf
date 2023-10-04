variable "cluster_name" {
  type = string
}

variable "manager_count" {
  type    = number
  default = 1
}

variable "worker_count" {
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
