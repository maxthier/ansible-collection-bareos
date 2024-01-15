# Ansible Collection - adfinis.bareos

A collection of roles to install and configure [Bareos](https://www.bareos.com).

## Using roles in this collection.

1. Install the collection:

```shell
ansible-galaxy collection install adfinis.bareos
```

You can also list a collection in `requirements.yml`:

```yaml
---
collections:
  - name: adfinis.bareos
```

2. Include roles in your playbooks:

```yaml
---
- name: make a great machine
  hosts: all
  tasks:
    - name: Install Bareos repository
      import_role:
        name: adfinis.bareos.repository
```
