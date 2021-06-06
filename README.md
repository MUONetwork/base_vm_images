# base_vm_images
Base VM images for packer

```bash
.
├── README.md
├── http       # Contain preseed config files
├── playbooks  # Ansible playbook for provisioning
├── scripts    # Some bash scripts for pre-provisioning
└── src        # packer templates
```

## Use

- Populate the secrets in [variables.json](src/variables.json.template)

- Build the VM template (for e.g. to build linut mint 20.1 template)
  ```bash
  packer build -timestamp-ui -var-file src/variables.json src/mint20.1/mint201-proxmox.json
  ```
