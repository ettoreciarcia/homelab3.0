variable "kubernetes" {
  type = object({
    number_of_controlplanes          = number
    ram_controlplane                 = number
    number_of_cpu_cores_controlplane = number

    number_of_workers          = number
    number_of_cpu_cores_worker = number
    ram_worker                 = number

    template_name = string
    target_node   = string

  })

  default = {
    number_of_controlplanes          = 3
    number_of_cpu_cores_controlplane = 2
    ram_controlplane                 = 2028

    number_of_workers          = 3
    number_of_cpu_cores_worker = 2
    ram_worker                 = 4096

    template_name = "rocky9.3-template"
    target_node   = "proxmox"
  }

  description = "Kubernetes variable"
}