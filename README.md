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

## Using playbooks in this collection

The playbooks aid to minimize the amount of necessary configuration and try to declare as much as possible in the form of defaults. In most scenarios stuff like client settings, backup file sets/excludes, retention are universally applicable for all (or most) clients.
Therefore the playbooks rely heavly on group_vars, as a lot of data has to be shared between the Bareos components.
For example: For every client/FD there needs to be some shared config data on both the Director (`/etc/bareos/bareos-dir.d/clients/<client fqdn>`) and the FD (`/etc/bareos/bareos-fd.d/<director>`) so a connection between them is possible.

For example the playbook `manage_clients_playbook.yml` loops over the host group `filedaemons` and applies all client_default settings (defined as group_vars) without having to manage dedicated host_vars for every client/FD.

### Example settings

An example set of default settings for all clients (`group_vars/all/main.yml`), where all FDs initiate the TCP connection:

```yaml
---

client_defaults:
  address: ""  # leave empty if the TCP connection should be initiated by the FD and not the Director
  password: "{{ hostvars['bareos-director']['director_password'] }}"  # host_vars/bareos-director/vault.yml
  maximum_concurrent_jobs: 3
  connection_from_fd: true    # TCP connection FD->Dir
  connection_from_dir: false  # TCP connection Dir-FD
  heartbeat: 60  # TCP connection heartbeat Dir<->FD
  enabled: true

job_defaults:
  name: Incremental_Daily
  pool: Pool_Daily
  type: Backup
  messages: Messages_Daily
  jobdefs: JobDef_StandardIncremental
  schedule: Schedule_StandardIncremental
  storage: Storage_bareosStorageDaemon.example.com
```

The host_vars of a host with different settings (`host_vars/host.example.com/main.yml`):
```yaml
---

bareos_fd_configuration:
  name: host.example.com
  address: host.example.com
  password: "{{ hostvars['bareos-director']['director_password'] }}"
  maximum_concurrent_jobs: 5
  enabled: true
  connection_from_fd: false
  connection_from_dir: true
```

### Playbooks
* **manage_clients_playbook.yml**: Sets up all clients/FDs (bareos_repository, bareos_fd) and deploys them dynamically on the Director (bareos_dir).
