# HASHICLUSTER

Installation of HashiCorp Vault, Consul & Nomad

## Requirements
N/A

# Role Variables
See 'vars/main.yml' & 'defaults/main.tf'

## Dependencies
N/A

## Example Playbook
> File: requirements.yml
```yaml
collections:
  - name: https://github.com/kred-no/ansible-collection-hashicorp.git
    type: git
    version: development
```

> File: playbook.yaml
```yaml
# - Skip Vault installation.
# - Install Consul (rolling latest version), w/custom configuration.
# - Install Nomad (pinned version), w/custom configuration.
# - Forward dns-queries on port 53 to consul on port 8600.
---
- name: MoleculeConverge
  hosts: all
  gather_facts: true

  collections:
    - 'kred.hashicluster'

  tasks:
    - name: "Role: HashiCorp"
      include_role:
        name: hashicluster
      vars:
        dns:
          forward: true
        cluster:
          consul:
            install: true
            config:
              log_level: err
              server: true
              data_dir: /var/opt/consul
              bootstrap_expect: 1
              client_addr: "0.0.0.0"
              ui: true
              performance:
                raft_multiplier: 10
              recursors:
                - 1.1.1.1
                - 8.8.8.8
              connect:
                enabled: true
              ports:
                grpc: 8502
          nomad:
            install: true
            version: '1.0.4'
            service:
              enabled: false
            config:
              server:
                enabled: true
                bootstrap_expect: 1
```

> Execute playbook
```bash
# Install collection
ansible-galaxy collection install -r requirements.yml

# Run plays
ansible-playbook playbook.yml --become
```


License
-------

See [LICENSE](LICENSE)

Author Information
------------------

Rune Rønneseth, Kreditorforeningens Driftssentral DA
