Role Name
=========

Installation of HashiCorp Vault, Consul & Nomad

Requirements
------------

N/A

Role Variables
--------------

See 'vars/main.yml' & 'defaults/main.tf'

Dependencies
------------

N/A

Example Playbook
----------------

```yaml
# - Skip Vault installation.
# - Install Consul (rolling latest version), w/custom configuration.
# - Install Nomad (pinned version), w/custom configuration.
# - Download CNI plugins (pinned version).
# - Forward dns-queries on port 53 to consul on port 8600.
---
- name: MoleculeConverge
  hosts: all
  gather_facts: true

  collections:
  - 'kds_rune.hashicluster'

  tasks:
  - name: "Include roles"
    include_role:
      name: hashicluster
    vars:
      cluster:
        consul:
          install: true
          manage_config: true
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
          manage_config: true
          config:
            server:
              enabled: true
              bootstrap_Expect: 1
      cni:
        install: true
        version: '0.9.1'
      dns:
        forward: true
...
```

License
-------

See [LICENSE](LICENSE)

Author Information
------------------

Rune Rønneseth, Kreditorforeningens Driftssentral DA
