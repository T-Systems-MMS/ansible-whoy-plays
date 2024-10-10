# ansible-who-plays

The script assumes the following folder structure:

```text
├── etc
│   ├── ansible
│   │   ├── playbooks
│   │   ├── roles
```

You can adjust these paths within the script by changing `playbooks_path` and `roles_path` to fit your folder structure.

## The two purposes of ansible-who-plays

Find all roles that are not used by any playbooks

```bash
/bin/bash who-plays.bash
```

Find all playbooks that use a given role

```bash
/bin/bash who-plays.bash <role-name>
```
