variable "pm_api_url" {
  type        = string
  description = "URL of the Proxmox API"
}

variable "pm_api_token_id" {
  type        = string
  description = "API token ID of the Terrafom Proxmox user"
}

variable "pm_api_token_secret" {
  type        = string
  description = "API token secret of the Terrafom Proxmox user"
}

variable "ssh_key" {
  type        = string
  description = "Key to provide SSH access to created VMs and containers"
}
