# terraform

<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 0.13 |
| <a name="requirement_proxmox"></a> [proxmox](#requirement\_proxmox) | 2.9.14 |

## Providers

No providers.

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_git_server"></a> [git\_server](#module\_git\_server) | ./modules/basic-vm | n/a |
| <a name="module_kubernetes"></a> [kubernetes](#module\_kubernetes) | ./modules/k8s-cluster | n/a |

## Resources

No resources.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_git_server"></a> [git\_server](#input\_git\_server) | Git variables | <pre>object({<br>    memory        = number<br>    cores         = number<br>    ip            = string<br>    vmid          = number<br>    template_name = string<br>    target_node   = string<br><br>  })</pre> | n/a | yes |
| <a name="input_kubernetes"></a> [kubernetes](#input\_kubernetes) | n/a | <pre>object({<br>    number_of_controlplanes          = number<br>    ram_controlplane                 = number<br>    number_of_cpu_cores_controlplane = number<br><br>    number_of_workers          = number<br>    number_of_cpu_cores_worker = number<br>    ram_worker                 = number<br><br>    template_name = string<br>    target_node   = string<br><br>  })</pre> | n/a | yes |

## Outputs

No outputs.
<!-- END_TF_DOCS -->
