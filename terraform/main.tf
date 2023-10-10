resource "proxmox_vm_qemu" "k3s_lb" {
  count       = 2
  name        = "k3s-lb-${count.index}"
  desc        = "k3s load balancer"
  onboot      = true
  target_node = var.proxmox_host
  clone       = var.template_name
  os_type     = "cloud-init"
  qemu_os     = "l26"
  cpu         = "kvm64"
  cores       = 2
  sockets     = 1
  memory      = 4096
  scsihw      = "virtio-scsi-pci"
  disk {
    size    = "10G"
    type    = "scsi"
    storage = "local-zfs"
  }

  network {
    model  = "virtio"
    bridge = "vmbr0"
  }

  ipconfig0 = "ip=10.10.3.${count.index + 98}/24,gw=10.10.3.1"
  sshkeys   = var.ssh_key
}

resource "proxmox_vm_qemu" "k3s_server" {
  count       = 3
  name        = "k3s-server-${count.index + 1}"
  desc        = "k3s server node"
  onboot      = true
  target_node = var.proxmox_host
  clone       = var.template_name
  os_type     = "cloud-init"
  qemu_os     = "l26"
  cpu         = "kvm64"
  cores       = 2
  sockets     = 2
  memory      = 16384
  scsihw      = "virtio-scsi-pci"
  disk {
    size    = "100G"
    type    = "scsi"
    storage = "local-zfs"
  }

  network {
    model  = "virtio"
    bridge = "vmbr0"
  }

  ipconfig0 = "ip=10.10.3.${count.index + 101}/24,gw=10.10.3.1"
  sshkeys   = var.ssh_key
}
