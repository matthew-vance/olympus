terraform {
  required_version = ">= 0.13"
  required_providers {
    proxmox = {
      source  = "telmate/proxmox"
      version = "2.9.14"
    }
  }
}

provider "proxmox" {
  pm_api_url          = var.pm_api_url
  pm_tls_insecure     = true
  pm_api_token_id     = var.pm_api_token_id
  pm_api_token_secret = var.pm_api_token_secret
}

module "pve_docker_apollo" {
  source = "./modules/pve_vm"

  hostname    = "apollo"
  description = "Docker host"
  pve_node    = "hera"
  template    = "debian-12-cloud-init"
  cores       = 6
  sockets     = 2
  memory      = 1024 * 32
  disk_size   = "100G"
  ip_address  = "10.10.3.101"
  ssh_key     = var.ssh_key
}
