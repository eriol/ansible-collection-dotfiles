# Ansible collection - eriol.dotfiles

Ansible roles that I wrote for my workstations.

## Installation

Create a `requirements.yml` with the following content:

```yaml
---
collections:
  - name: https://noa.mornie.org/eriol/ansible-collection-dotfiles
    type: git
    version: 0.1.0
```

and then, using ansible >= 2.10, run:

```
ansible-galaxy collection install -r requirements.yml
```
