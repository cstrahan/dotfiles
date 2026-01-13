# Ansible Playbooks

Ansible playbooks for provisioning Ubuntu systems.

## Installation

Install Ansible and extras via uv:

```bash
uv tool install --with-executables-from ansible-dev-tools,ansible-builder,ansible-core,ansible-creator,ansible-dev-environment,ansible-lint,ansible-sign,molecule,ansible-navigator ansible
```

## Structure

- `user.yml` - Playbook for user account provisioning
- `tasks/user.yml` - User account tasks (shell, tools, dotfiles)

## Usage

The `user` variable defaults to the login user on the remote host (via `whoami`).

Provision a user account:

```bash
ansible-playbook -i inventory user.yml
```

Or specify a different user:

```bash
ansible-playbook -i inventory -e user=charles.strahan user.yml
```

Configure root account:

```bash
ansible-playbook -i inventory -e user=root user.yml
```

Profile task performance:

```bash
ANSIBLE_CALLBACKS_ENABLED=timer,profile_tasks ansible-playbook -i inventory user.yml
```

Enable pipelining (reduces SSH round-trips, enabled by default in ansible.cfg):

```bash
ANSIBLE_PIPELINING=true ansible-playbook -i inventory user.yml
```

## OrbStack

To run against an OrbStack machine:

```bash
ansible-playbook -i "${machine}@orb," -u "${machine}" -e user="$(orb -m "${machine}" whoami)" user.yml
```

## macOS Self-Provisioning

To provision a macOS machine, SSH must be enabled first.

### Enable SSH via System Settings

1. Open the Apple menu and select **System Settings**
2. Navigate to **General** in the sidebar, then click **Sharing**
3. Find **Remote Login** and toggle the switch to **On**
4. (Optional) Click the info button next to the switch to restrict access to specific users or enable "Allow full disk access for remote users"

### Enable SSH via Terminal

```bash
# Enable SSH
sudo systemsetup -setremotelogin on

# Check status
sudo systemsetup -getremotelogin
```

### Passwordless Localhost SSH

To enable passwordless SSH to localhost (for self-provisioning):

```bash
[ ! -f ~/.ssh/authorized_keys ] && cp ~/.ssh/id_ed25519.pub ~/.ssh/authorized_keys
```
