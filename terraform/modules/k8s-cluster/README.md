# k8s-cluster

<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 0.13 |
| <a name="requirement_proxmox"></a> [proxmox](#requirement\_proxmox) | 2.9.14 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_proxmox"></a> [proxmox](#provider\_proxmox) | 2.9.14 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [proxmox_vm_qemu.ha_proxy](https://registry.terraform.io/providers/Telmate/proxmox/2.9.14/docs/resources/vm_qemu) | resource |
| [proxmox_vm_qemu.kubernetes_controlplane](https://registry.terraform.io/providers/Telmate/proxmox/2.9.14/docs/resources/vm_qemu) | resource |
| [proxmox_vm_qemu.kubernetes_workers](https://registry.terraform.io/providers/Telmate/proxmox/2.9.14/docs/resources/vm_qemu) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_kubernetes"></a> [kubernetes](#input\_kubernetes) | Kubernetes variable | <pre>object({<br>    number_of_controlplanes          = number<br>    ram_controlplane                 = number<br>    number_of_cpu_cores_controlplane = number<br><br>    number_of_workers          = number<br>    number_of_cpu_cores_worker = number<br>    ram_worker                 = number<br><br>    template_name = string<br>    target_node   = string<br><br>  })</pre> | <pre>{<br>  "number_of_controlplanes": 3,<br>  "number_of_cpu_cores_controlplane": 2,<br>  "number_of_cpu_cores_worker": 2,<br>  "number_of_workers": 3,<br>  "ram_controlplane": 2028,<br>  "ram_worker": 4096,<br>  "target_node": "proxmox",<br>  "template_name": "rocky9.3-template"<br>}</pre> | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_controplane_ipv4_addresses"></a> [controplane\_ipv4\_addresses](#output\_controplane\_ipv4\_addresses) | Map of Kubernetes controlplanes with their corresponding IPv4 addresses |
| <a name="output_ha_proxy_ipv4_addresses"></a> [ha\_proxy\_ipv4\_addresses](#output\_ha\_proxy\_ipv4\_addresses) | Map of HA Proxy with their corresponding IPv4 addresses |
| <a name="output_worker_ipv4_addresses"></a> [worker\_ipv4\_addresses](#output\_worker\_ipv4\_addresses) | Map of Kubernetes workers with their corresponding IPv4 addresses. |
<!-- END_TF_DOCS -->
