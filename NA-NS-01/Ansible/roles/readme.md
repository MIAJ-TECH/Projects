<!-- add all roles in this folder -->

# 🛠️ Setup BIND Role

This Ansible role automates the installation and configuration of the BIND (Berkeley Internet Name Domain) DNS server on a target system. The role includes tasks to set up necessary directories, configure log files, and manage zone files.

## 📋 Summary of Tasks

1. **Update APT Cache**: Ensures the package manager's cache is up to date.
2. **Install BIND9**: Installs the BIND DNS server package.
3. **Set Timezone**: Configures the system timezone to Asia/Riyadh.
4. **Change Ownership of Configuration Directory**: Modifies ownership of `/etc/bind` to the `bind` user and group.
5. **Create Logs Directory**: Sets up a directory for named logs at `/var/log/named`.
6. **Copy Configuration Files**: Deploys the main configuration files (`named.conf`, `named.conf.local`, and zone files) from templates.
7. **Create Necessary Directories**: Ensures that directories for named data are present, with appropriate ownership and permissions.

## 🔧 Handlers

- **Restart Named**: A handler that restarts the BIND service whenever configuration files are modified.

## 📂 Templates

To properly configure BIND, you need to provide the following Jinja2 templates, which should be placed in the `templates` directory:

- `db.forward.j2`: Template for the forward zone file.
- `db.reverse.j2`: Template for the reverse zone file.
- `named.conf.j2`: Template for the main BIND configuration file.
- `named.conf.local.j2`: Template for local configuration.

### 📁 Folder Structure

Here’s the recommended folder structure for your Ansible setup:

```plaintext
├── Ansible
│   ├── ansible.cfg
│   ├── inventory
│   │   ├── hosts.ini
│   │   └── hosts.tpl
│   ├── playbook.yml
│   └── roles
│       ├── readme.md
│       └── setup_bind
│           ├── handlers
│           │   └── main.yml
│           ├── tasks
│           │   └── main.yml
│           ├── templates
│           │   ├── db.forward.j2
│           │   ├── db.reverse.j2
│           │   ├── named.conf.j2
│           │   └── named.conf.local.j2
│           └── vars
│               └── main.yml
```

## 🚀 Usage

To use this role, ensure that the appropriate Jinja2 templates for configuration files are available in the `templates` directory.

Set the `setup_bind_domain` and `setup_bind_rev_domain` variables in your playbook to define your forward and reverse zones.

## 📋 Requirements

- Ansible 2.9 or higher
- Python 3.x
- `community.general` collection for timezone management

This role is designed to simplify BIND DNS server setup and is suitable for environments where a DNS service is required.
