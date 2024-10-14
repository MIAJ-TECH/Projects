terraform {
  required_providers {
    proxmox = {
      source  = "bpg/proxmox"
      version = ">0.65.0"
    }
  }
}
provider "proxmox" {
  endpoint  = var.endpoint
  api_token = var.api_token
  insecure  = true

  ssh {
    agent    = false
    username = "root"
  }
}
