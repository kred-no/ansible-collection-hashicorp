# DOCKER
Basic installation of docker from official repository

## Requirements
N/A

## Role Variables
defaults:
  * repo_branch: **stable** | nightly | test
  * service_state: **started** | reloaded | restarted | stopped

Dependencies
------------
N/A

Example Playbook
----------------
```bash
---
- name: DockerExample
  hosts: all
  gather_facts: true
  
  collections:
  - 'kds_rune.hashicluster'
  
  tasks:
  - name: "Include roles"
    include_role:
      name: docker
    vars:
      repo: test
...
```
License
-------

BSD

Author Information
------------------

An optional section for the role authors to include contact information, or a website (HTML is not allowed).
