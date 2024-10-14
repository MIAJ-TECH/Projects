variable "vm_name" {
  description = "Name of the VM"
  type        = string
}

variable "vm_id" {
  description = "ID of the VM"
  type        = number
}

variable "node_name" {
  description = "Name of the Proxmox node"
  type        = string
}

variable "clone_vm_id" {
  description = "ID of the VM to clone"
  type        = number
}

variable "bridge_name" {
  description = "Name of the bridge for network"
  type        = string
}

variable "datastore_id" {
  description = "ID of the datastore"
  type        = string
}

variable "base_ipv4_address" {
  description = "IPv4 address configuration"
  type        = string
}
variable "gw" {
  description = "gw address configuration"
  type        = string
}
variable "node_count" {
  type = string
}
variable "endpoint" {
  type      = string
  sensitive = true

}
variable "api_token" {
  type      = string
  sensitive = true
}

variable "user_account_username" {
  description = "Username for the user account"
  type        = string
  default     = "srvadmin"  # You can set a default value or leave it empty
}

variable "user_account_password" {
  description = "Password for the user account"
  type        = string
  sensitive   = true  # Mark as sensitive to prevent it from being displayed

}

variable "user_account_keys" {
  description = "List of SSH keys for the user account"
  type        = list(string)

}
variable "vga_memory" {
  description = "Memory allocation for VGA"
  type        = number
  default     = 16  # Set a default value
}

variable "vga_type" {
  description = "Type of VGA"
  type        = string
  default     = "serial0"  # Set a default value
}
