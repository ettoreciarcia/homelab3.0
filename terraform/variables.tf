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
}
