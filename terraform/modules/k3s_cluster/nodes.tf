resource "proxmox_vm_qemu" "k8s_manager" {
  count       = var.server_count
  name        = "k3s-server-${count.index}"
  desc        = "k3s server node"
  tags        = "k3s;server"
  onboot      = true
  target_node = var.proxmox_host
  clone       = var.template_name
  os_type     = "cloud-init"
  qemu_os     = "l26"
  cpu         = "kvm64"
  cores       = 2
  sockets     = 2
  memory      = 8192
  scsihw      = "virtio-scsi-pci"
  disk {
    size    = var.node_disk_size
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

resource "proxmox_vm_qemu" "k8s_worker" {
  count       = var.agent_count
  name        = "k3s-agent-${count.index}"
  desc        = "k3s agent node"
  tags        = "k3s;agent"
  onboot      = true
  target_node = var.proxmox_host
  clone       = var.template_name
  os_type     = "cloud-init"
  qemu_os     = "l26"
  cpu         = "kvm64"
  cores       = 2
  sockets     = 2
  memory      = 8192
  scsihw      = "virtio-scsi-pci"
  disk {
    size    = var.node_disk_size
    type    = "scsi"
    storage = "local-zfs"
  }

  network {
    model  = "virtio"
    bridge = "vmbr0"
  }

  ipconfig0 = "ip=10.10.3.${count.index + 111}/24,gw=10.10.3.1"
  sshkeys   = var.ssh_key
}
