# CHANGELOG
## 0.1.0 (Unreleased)
#### GENERAL
  * Uses HashiCorp official package repositories.
  * Support for Debian (apt) & RedHat (yum) distributions.
  * Support for Vault, Consul & Nomad (versioned & latest) installations.
  * Optional support for managing configurationfiles (streaming yaml -> json). See examples.
  * Molecule for testing.
#### NOMAD
  * Support for installing CNI-plugins.
#### CONSUL
  * Support for configuring dns-routing via iptables.