variable "vm_id" {
  type        = number
  description = "The ID of the VM in Proxmox. The default value of 0 indicates it should use the next available ID in the sequence"
  default     = 0
}

variable "hostname" {
  type        = string
  description = "Hostname of the VM"
}

variable "description" {
  type        = string
  description = "Description of the VM"
  default     = ""
}

variable "pve_node" {
  type        = string
  description = "Proxmox node to create the VM on"
}

variable "template" {
  type        = string
  description = "Template to clone the VM from. This must be a cloud-init enabled template"
}

variable "cores" {
  type        = number
  description = "Number of CPU cores to allocate to the VM. Totals cores = cores * sockets"
  default     = 2
}

variable "sockets" {
  type        = number
  description = "Number of CPU sockets to allocate to the VM"
  default     = 1
}

variable "memory" {
  type        = number
  description = "Amount of memory to allocate to the VM in MB"
  default     = 2048
}

variable "disk_size" {
  type        = string
  description = "Size of the VM's disk"
  default     = "32G"
}

variable "ip_address" {
  type        = string
  description = "IP address of the VM"
}

variable "ssh_key" {
  type        = string
  description = "SSH key to add to the VM"
}
