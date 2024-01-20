variable "basic_variables" {
  type = object({
    memory = number
    cores  = number
    ip     = string
    vmid   = number
    template_name = string
    target_node = string

  })
  description = "Basic variables"
}