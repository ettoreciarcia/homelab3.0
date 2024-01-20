terraform {

  required_version = ">= 0.13"
  required_providers {
    proxmox = {
      source  = "Telmate/proxmox"
      version = "2.9.14"
    }

  }


  backend "s3" {
    bucket = "terraform-state-project-ciarcia"
    key    = "internal-proxmox.tfstate"
    region = "eu-west-1"
    dynamodb_table = "terraformstate_lock_internal"
  }
}

provider "proxmox" {
  pm_api_url  = "https://proxmox.internal.ettoreciarcia.com:8006/api2/json"
  pm_parallel = 20
}
