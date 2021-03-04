# CHANGELOG
## 0.1.4 (Unreleased)
#### GENERAL
  * Moved to 'kred' namespace
  * Moved cni-plugins to separate role
  * Fixed 'ansible_os_family' check at start of playbooks.
  * Added override variable to try installation even if OS not supported/recognized (force_install: true).

## 0.1.3 (2021-03-03)
#### GENERAL
  * Added basic docker role (Debian/Ubuntu)

## 0.1.2 (2021-03-03)
#### GENERAL
  * Added service-templates, since the defaults use .hcl & validate its existence
  * Enforce custom configfile & servicefile. It's just easier this way..

## 0.1.1 (2021-03-02)
#### GENERAL
  * Updated supported OS-matrix
  * Added extra info (collections + python-req.) to examples

## 0.1.0 (2021-03-01)
#### GENERAL
  * Uses HashiCorp official package repositories.
  * Support for Debian (apt) & RedHat (yum) distributions.
  * Support for Vault, Consul & Nomad (versioned & latest) installations.
  * Optional support for managing configurationfiles (streaming yaml -> json). See examples.
  * Molecule for testing.
#### NOMAD
  * Support for installing CNI-plugins.
#### CONSUL
  * Support for configuring dns-forwarding via iptables (Debian).