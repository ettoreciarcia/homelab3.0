output "worker_ipv4_addresses" {
  value = {
    kubernetes_workers = [
      for vm in proxmox_vm_qemu.kubernetes_workers :
      {
        name         = vm.name
        ipv4_address = vm.default_ipv4_address
      }
    ]
  }

  description = "Map of Kubernetes workers with their corresponding IPv4 addresses."
}

output "controplane_ipv4_addresses" {
  value = {
    kubernetes_controlplane = [
      for vm in proxmox_vm_qemu.kubernetes_controlplane :
      {
        name         = vm.name
        ipv4_address = vm.default_ipv4_address
      }
    ]
  }

  description = "Map of Kubernetes controlplanes with their corresponding IPv4 addresses"
}

output "ha_proxy_ipv4_addresses" {
  value = {
    ha_proxy = [
      for vm in proxmox_vm_qemu.ha_proxy :
      {
        name         = vm.name
        ipv4_address = vm.default_ipv4_address
      }
    ]
  }

  description = "Map of HA Proxy with their corresponding IPv4 addresses"
}