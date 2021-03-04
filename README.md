# Ansible Collection - kreditorforeningens_driftssentral_da.hashicluster

**[Ansible Galaxy](https://galaxy.ansible.com/kds_rune/hashicluster) | [GitHub](https://github.com/Kreditorforeningens-Driftssentral-DA/ansible-collection-hashicluster)**

## DESCRIPTION
Installation of HashiCorp Vault, Consul & Nomad vi aofficial repositories

  * Supports both pinned & latest versions.
  * Optional management of CNI-plugins.
  * Optional management of configuration-files (YAML -> JSON).
  * Optional configuration of iptables forwarding (consul-dns). Only Debian/Ubuntu.
  * Optional System unit/service management.

**KISS:** The primary goal is to keep the collection/roles/plays as clean, readable and requiring as little maintenance as possible.

## EXAMPLE PLAYBOOK
> File: requirements.yml
```yaml
# Example for downloading directly from git
---
collections:
- name: https://github.com/Kreditorforeningens-Driftssentral-DA/ansible-collection-hashicluster.git
  type: git
  version: development
...
```

> File: playbook.yaml
```yaml
# - Install Docker
# - Download CNI plugins (pinned version).
# - Skip Vault installation.
# - Install Consul (rolling latest version), w/custom configuration.
# - Install Nomad (pinned version), w/custom configuration.
# - Forward dns-queries on port 53 to consul on port 8600.
# - Install basic docker-role included in repo
---
- name: MoleculeConverge
  hosts: all
  gather_facts: true

  collections:
  - 'kred.hashicluster'

  tasks:
  - name: Install Docker
    include_role:
      name: docker

  - name: Install CNI-Plugins
    include_role:
      name: cni
    vars:
      cni:
        install: true
        version: '0.9.1'

  - name: Install Cluster applications
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
          service: { enabled: false }
          config:
            server:
              enabled: true
              bootstrap_Expect: 1
...
```

> Execute playbook
```bash
# Install collection
ansible-galaxy collection install -r requirements.yml

# Run plays
ansible-playbook playbook.yml --become
```

