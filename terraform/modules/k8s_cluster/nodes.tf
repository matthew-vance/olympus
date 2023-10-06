resource "proxmox_vm_qemu" "k8s_manager" {
  count       = var.manager_count
  name        = format("%s-m%02s", var.cluster_name, count.index)
  desc        = "k8s manager node"
  tags        = "k8s;manager"
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

resource "proxmox_vm_qemu" "k8s_worker" {
  count       = var.worker_count
  name        = format("%s-w%02s", var.cluster_name, count.index)
  desc        = "k8s worker node"
  tags        = "k8s;worker"
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
    size    = "100G"
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
