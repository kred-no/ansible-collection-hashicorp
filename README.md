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

```yaml
# - Skip Vault installation.
# - Install Consul (rolling latest version), w/custom configuration.
# - Install Nomad (pinned version), w/custom configuration.
# - Download CNI plugins (pinned version).
# - Forward dns-queries on port 53 to consul on port 8600.
# - Install basic docker-role included in repo
---
- name: MoleculeConverge
  hosts: all
  gather_facts: true

  collections:
  - 'kds_rune.hashicluster'

  tasks:
  - name: Install Docker driver
    include_role:
      name: docker

  - name: Install Cluster applications
    include_role:
      name: hashicluster
    vars:
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
      cni:
        install: true
        version: '0.9.1'
      dns:
        forward: true
```
