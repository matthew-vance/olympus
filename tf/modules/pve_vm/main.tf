terraform {
  required_version = ">= 0.13"
  required_providers {
    proxmox = {
      source  = "telmate/proxmox"
      version = "2.9.14"
    }
  }
}

resource "proxmox_vm_qemu" "pve_vm" {
  vmid        = var.vm_id
  name        = var.hostname
  desc        = var.description
  onboot      = true
  target_node = var.pve_node
  clone       = var.template
  os_type     = "cloud-init"
  qemu_os     = "l26"
  cpu         = "kvm64"
  cores       = var.cores
  sockets     = var.sockets
  memory      = var.memory
  scsihw      = "virtio-scsi-pci"
  disk {
    size    = var.disk_size
    type    = "scsi"
    storage = "local-zfs"
  }

  network {
    model  = "virtio"
    bridge = "vmbr0"
  }

  ipconfig0 = "ip=${var.ip_address}/24,gw=10.10.3.1"
  sshkeys   = var.ssh_key
}
