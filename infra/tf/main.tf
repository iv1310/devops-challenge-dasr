locals {
  vm_lists = {
    kube-pg-master01 = {
      cores     = 2
      socket    = 1
      memory    = 4096
      disk_size = "40G"
    },
    kube-pg-master02 = {
      cores     = 2
      socket    = 1
      memory    = 4096
      disk_size = "40G"
    },
    kube-pg-node01 = {
      cores     = 1
      socket    = 1
      memory    = 2048
      disk_size = "35G"
    },
    kube-pg-node02 = {
      cores     = 1
      socket    = 1
      memory    = 2048
      disk_size = "35G"
    }
  }
  template_name = "ivan-template-debian11"
  target_node   = "host5"
}

resource "proxmox_vm_qemu" "this" {
  for_each    = local.vm_lists
  name        = each.key
  target_node = local.target_node
  clone       = local.template_name

  agent   = 1
  os_type = "cloud-init"
  cores   = each.value.cores
  sockets = each.value.socket
  cpu     = "host"
  memory  = each.value.memory
  scsihw  = "virtio-scsi-pci"
  boot    = "order=scsi0;ide2;net0"

  disk {
    slot    = 0
    size    = each.value.disk_size
    type    = "scsi"
    storage = "local"
  }

  network {
    model  = "virtio"
    bridge = "vmbr1"
  }
}
