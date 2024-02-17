output "ip_addresses" {
  value       = { for vm in proxmox_vm_qemu.this : vm.name => vm.default_ipv4_address }
  description = "The IP Address of the VMs."
}
