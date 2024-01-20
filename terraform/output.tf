output "worker_ipv4_addresses" {
  value = module.kubernetes.worker_ipv4_addresses
  description = "Map of Kubernetes workers with their corresponding IPv4 addresses."
}

output "controplane_ipv4_addresses" {
  value = module.kubernetes.controplane_ipv4_addresses
  description = "Map of Kubernetes controlplanes with their corresponding IPv4 addresses"
}

output "ha_proxy_ipv4_addresses" {
  value = module.kubernetes.ha_proxy_ipv4_addresses
  description = "Map of HA Proxy with their corresponding IPv4 addresses"
}