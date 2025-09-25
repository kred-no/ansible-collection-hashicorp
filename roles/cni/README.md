# CNI

Installation of CNI plugins: [GitHub]("https://github.com/containernetworking/plugins")

## Requirements
N/A

## Role Variables
See 'vars/main.yml' & 'defaults/main.tf'

## Dependencies
N/A

## Example Playbook

```yaml
# - Download & validate CNI plugins v0.9.1 archive.
# - Unarchive to default location.
# - Set owner to (pre-existing) user 'hashicorp'
---
- name: MoleculeConverge
  hosts: all
  gather_facts: true

  collections:
  - 'kds_rune.hashicluster'

  tasks:
  - name: Add CNI-plugins
    include_role:
      name: cni
    vars:
      cni:
        install: true
        version: '0.9.1'
        owner: hashicorp
        group: hashicorp
```

License
-------

See [LICENSE](LICENSE)

Author Information
------------------

Rune Rønneseth, Kreditorforeningens Driftssentral DA
