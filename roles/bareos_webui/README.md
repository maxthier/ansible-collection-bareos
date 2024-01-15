# Ansible role [bareos_webui](#bareos_webui)

Install and configure [Bareos](https://www.bareos.com/) WebUI on your system.

|GitHub|GitLab|Downloads|Version|
|------|------|---------|-------|
|[![github](https://github.com/adfinis/ansible-role-bareos_webui/workflows/Ansible%20Molecule/badge.svg)](https://github.com/adfinis/ansible-role-bareos_webui/actions)|[![gitlab](https://gitlab.com/robertdebock-iac/ansible-role-bareos_webui/badges/master/pipeline.svg)](https://gitlab.com/robertdebock-iac/ansible-role-bareos_webui)|[![downloads](https://img.shields.io/ansible/role/d/)](https://galaxy.ansible.com/adfinis/bareos_webui)|[![Version](https://img.shields.io/github/release/adfinis/ansible-role-bareos_webui.svg)](https://github.com/adfinis/ansible-role-bareos_webui/releases/)|

## [Example Playbook](#example-playbook)

This example is taken from [`molecule/default/converge.yml`](https://github.com/adfinis/ansible-role-bareos_webui/blob/master/molecule/default/converge.yml) and is tested on each push, pull request and release.

```yaml
---
- name: Converge
  hosts: all
  become: yes
  gather_facts: yes

  roles:
    - role: adfinis.roles.bareos_webui
      bareos_webui_directors:
        - name: localhost-dir
          enabled: yes
          diraddress: localhost
        - name: disabled-dir
          enabled: no
```

The machine needs to be prepared. In CI this is done using [`molecule/default/prepare.yml`](https://github.com/adfinis/ansible-role-bareos_webui/blob/master/molecule/default/prepare.yml):

```yaml
---
- name: Prepare
  hosts: all
  become: yes
  gather_facts: no

  roles:
    - role: robertdebock.bootstrap
    - role: adfinis.roles.bareos_repository
```

These roles are provided as is, without warranty of any kind. Use it at your own risk.

## [Role Variables](#role-variables)

The default values for the variables are set in [`defaults/main.yml`](https://github.com/adfinis/ansible-role-bareos_webui/blob/master/defaults/main.yml):

```yaml
---
# defaults file for bareos_webui

bareos_webui_configuration:
  - section: session
    option: timeout
    value: 3600

bareos_webui_directors: []
```

## [Requirements](#requirements)

- pip packages listed in [requirements.txt](https://github.com/adfinis/ansible-role-bareos_webui/blob/master/requirements.txt).

## [State of used roles](#state-of-used-roles)

The following roles are used to prepare a system. You can prepare your system in another way.

| Requirement | GitHub | GitLab |
|-------------|--------|--------|
|[robertdebock.bootstrap](https://galaxy.ansible.com/adfinis/robertdebock.bootstrap)|[![Build Status GitHub](https://github.com/adfinis/robertdebock.bootstrap/workflows/Ansible%20Molecule/badge.svg)](https://github.com/adfinis/robertdebock.bootstrap/actions)|[![Build Status GitLab](https://gitlab.com/robertdebock-iac/robertdebock.bootstrap/badges/master/pipeline.svg)](https://gitlab.com/robertdebock-iac/robertdebock.bootstrap)|
|[adfinis.bareos_repository](https://galaxy.ansible.com/adfinis/bareos_repository)|[![Build Status GitHub](https://github.com/adfinis/ansible-role-bareos_repository/workflows/Ansible%20Molecule/badge.svg)](https://github.com/adfinis/ansible-role-bareos_repository/actions)|[![Build Status GitLab](https://gitlab.com/robertdebock-iac/ansible-role-bareos_repository/badges/master/pipeline.svg)](https://gitlab.com/robertdebock-iac/ansible-role-bareos_repository)|

## [Context](#context)

This role is a part of many compatible roles. Have a look at [the documentation of these roles](https://adfinis.com/) for further information.

Here is an overview of related roles:
![dependencies](https://raw.githubusercontent.com/adfinis/ansible-role-bareos_webui/png/requirements.png "Dependencies")

## [Compatibility](#compatibility)

This role has been tested on these [container images](https://hub.docker.com/u/robertdebock):

|container|tags|
|---------|----|
|[Debian](https://hub.docker.com/r/robertdebock/debian)|bookworm, bullseye, buster|
|[EL](https://hub.docker.com/r/robertdebock/enterpriselinux)|8, 9|
|[Fedora](https://hub.docker.com/r/robertdebock/fedora/)|37, 38|
|[Ubuntu](https://hub.docker.com/r/robertdebock/ubuntu)|jammy, focal|

The minimum version of Ansible required is 2.12, tests have been done to:

- The previous version.
- The current version.
- The development version.

If you find issues, please register them in [GitHub](https://github.com/adfinis/ansible-role-bareos_webui/issues).

## [License](#license)

[Apache-2.0](https://github.com/adfinis/ansible-role-bareos_webui/blob/master/LICENSE).

## [Author Information](#author-information)

[Adfinis](https://adfinis.com/)

