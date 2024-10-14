locals {
  ansible_dir   = "../Ansible"
  inventory_dir = "${local.ansible_dir}/inventory"
}
data "template_file" "nodes_inventory" {
  template = file("${local.inventory_dir}/hosts.tpl")

  vars = {
    na_ns_ip = proxmox_virtual_environment_vm.na_ns.ipv4_addresses[1][0] // Adjust index as necessary
  }
}

resource "local_file" "nodes_inventory" {
  content  = data.template_file.nodes_inventory.rendered
  filename = "${local.inventory_dir}/hosts.ini"
  provisioner "local-exec" {
    command = "ANSIBLE_CONFIG=${local.ansible_dir}/ansible.cfg ansible-playbook -i ${local_file.nodes_inventory.filename} ${local.ansible_dir}/playbook.yml"
  }
}
