resource "proxmox_vm_qemu" "basic-vm" {
  vmid  = var.basic_variables.vmid
  name  = "git"
  target_node = var.basic_variables.target_node
  clone = var.basic_variables.template_name
  # basic VM settings here. agent refers to guest agent
  agent    = 1
  os_type  = "cloud-init"
  cores    = var.basic_variables.cores
  sockets  = 1
  cpu      = "host"
  memory   = var.basic_variables.memory
  scsihw   = "virtio-scsi-pci"
  bootdisk = "scsi0"
  disk {
    slot = 0
    # set disk size here. leave it small for testing because expanding the disk takes time.
    size = "20G"
    type = "scsi"
    # file    = "vm-controplane-${count.index + 1}-disk-0"
    storage  = "local-lvm"
    volume   = "local-lvm:vm-${var.basic_variables.vmid}-disk-0"
    iothread = 0 #due to https://github.com/Telmate/terraform-provider-proxmox/issues/460
  }

  # if you want two NICs, just copy this whole network section and duplicate it
  network {
    model  = "virtio"
    bridge = "vmbr0"
  }
  # not sure exactly what this is for. presumably something about MAC addresses and ignore network changes during the life of the VM
  lifecycle {
    ignore_changes = [
      network,
    ]
  }

  # the ${count.index + 1} thing appends text to the end of the ip address
  # in this case, since we are only adding a single VM, the IP will
  # be 10.98.1.91 since count.index starts at 0. this is how you can create
  # multiple VMs and have an IP assigned to each (.91, .92, .93, etc.)
  ipconfig0 = "ip=${var.basic_variables.ip}/24,gw=192.168.0.1"

}


