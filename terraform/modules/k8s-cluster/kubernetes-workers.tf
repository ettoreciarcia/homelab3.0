resource "proxmox_vm_qemu" "kubernetes_workers" {
  count = var.kubernetes.number_of_workers # just want 1 for now, set to 0 and apply to destroy VM
  name  = "worker-${count.index + 1}"     #count.index starts at 0, so + 1 means this VM will be named test-vm-1 in proxmox
  vmid  = "30${count.index + 1}"
  # this now reaches out to the vars file. I could've also used this var above in the pm_api_url setting but wanted to spell it out up there. target_node is different than api_url. target_node is which node hosts the template and thus also which node will host the new VM. it can be different than the host you use to communicate with the API. the variable contains the contents "prox-1u"
  target_node = var.kubernetes.target_node
  # another variable with contents "ubuntu-2004-cloudinit-template"
  clone = var.kubernetes.template_name
  # basic VM settings here. agent refers to guest agent
  agent    = 1
  os_type  = "cloud-init"
  cores    = var.kubernetes.number_of_cpu_cores_worker
  sockets  = 1
  cpu      = "host"
  memory   = var.kubernetes.ram_worker
  scsihw   = "virtio-scsi-pci"
  bootdisk = "scsi0"
  disk {
    slot = 0
    # set disk size here. leave it small for testing because expanding the disk takes time.
    size     = "20G"
    type     = "scsi"
    storage  = "local-lvm"
    volume   = "local-lvm:vm-30${count.index + 1}-disk-0"
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
  ipconfig0 = "ip=192.168.0.10${count.index + 1}/24,gw=192.168.0.1"

}


