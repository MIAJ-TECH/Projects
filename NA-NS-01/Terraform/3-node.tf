resource "proxmox_virtual_environment_vm" "na_ns" {
  name      = var.vm_name
  vm_id     = var.vm_id
  node_name = var.node_name

  clone {
    vm_id = var.clone_vm_id
    full  = true
  }

  network_device {
    bridge   = var.bridge_name
    firewall = true
  }

  vga {
    memory = var.vga_memory
    type   = var.vga_type
  }

  initialization {
    datastore_id = var.datastore_id

    ip_config {
      ipv4 {
        address = "${var.base_ipv4_address}/29"
        gateway = var.gw
      }
    }

    user_account {
      username = var.user_account_username
      password = var.user_account_password
      keys     = var.user_account_keys
    }
  }
}

resource "proxmox_virtual_environment_firewall_rules" "inbound" {
  node_name = var.node_name
  vm_id     = proxmox_virtual_environment_vm.na_ns.vm_id

  depends_on = [proxmox_virtual_environment_vm.na_ns]

  rule {
    action = "ACCEPT"
    type   = "in"
    dport  = 22
    proto  = "tcp"
  }
}
