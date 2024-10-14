# 🚀 Deploy Name Server For NA Site

🌟 **Infrastructure as Code with Terraform & Ansible** 🌟

## 🛠️ What It Does:
- **Terraform**: Automates VM deployment
  - 🖥️ Create a new VM from a clone
  - 📡 Configure networking and firewall rules
  - 📋 Output the VM IP
  - 📄 Generate Ansible inventory file
  - ⚙️ Trigger Ansible playbook after VM creation

## 📦 Variables:
- **VM Configuration**: Name, ID, Node, Clone ID
- **Network Settings**: Bridge name, IP address, Gateway
- **User Account**: Username, password, SSH keys
- **VGA Settings**: Memory and type
- **Proxmox API**: Endpoint and token (sensitive)

## 🚀 Usage:
1. Set variables in `terraform.tfvars`.
2. Initialize Terraform with `terraform init`.
3. Apply the configuration using `terraform apply`.

Ensure you have access to the Proxmox environment and the necessary permissions!

For more details, refer to the [Terraform documentation](https://www.terraform.io/docs) and [Proxmox documentation](https://pve.proxmox.com/pve-docs/).
