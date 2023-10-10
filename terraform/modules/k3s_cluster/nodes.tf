resource "proxmox_vm_qemu" "k3s_clb" {
  count       = 2
  name        = "k3s-clb-${count.index}"
  desc        = "k3s cluster load balancer"
  tags        = "k3s;lb"
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

  ipconfig0 = "ip=10.10.3.${count.index + 90}/24,gw=10.10.3.1"
  sshkeys   = var.ssh_key
}

resource "proxmox_vm_qemu" "k3s_alb" {
  count       = 2
  name        = "k3s-alb-${count.index}"
  desc        = "k3s application load balancer"
  tags        = "k3s;lb"
  onboot      = true
  target_node = var.proxmox_host
  clone       = var.template_name
  os_type     = "cloud-init"
  qemu_os     = "l26"
  cpu         = "kvm64"
  cores       = 2
  sockets     = 1
  memory      = 4086
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

  ipconfig0 = "ip=10.10.3.${count.index + 95}/24,gw=10.10.3.1"
  sshkeys   = var.ssh_key
}

resource "proxmox_vm_qemu" "k3s_server" {
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

resource "proxmox_vm_qemu" "k3s_agent" {
  count       = var.agent_count
  name        = "k3s-agent-${count.index}"
  desc        = "k3s agent node"
  tags        = "agent;k3s"
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
