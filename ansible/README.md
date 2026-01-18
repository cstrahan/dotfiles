# Ansible Playbooks

Ansible playbooks for provisioning Ubuntu systems.

## Installation

Install Ansible and extras via uv:

```bash
uv tool install --with "molecule-plugins[azure,docker,ec2,gce,podman,openstack,vagrant]" --with-executables-from ansible-dev-tools,ansible-builder,ansible-core,ansible-creator,ansible-dev-environment,ansible-lint,ansible-sign,molecule,ansible-navigator ansible
```

## Structure

```
.
├── ansible.cfg              # Project-specific settings (pipelining, callbacks)
├── inventory                # Host definitions
├── playbook.yml             # Main entry point
├── requirements.txt         # Python dependencies for Molecule testing
├── group_vars/
│   └── all.yml              # Variables for all hosts (tool versions, packages)
├── roles/
│   ├── plocate/             # System database indexing
│   │   └── tasks/
│   │       └── main.yml
│   └── dev_user/            # User development environment
│       ├── tasks/
│       │   ├── main.yml     # Entry point
│       │   ├── setup_facts.yml
│       │   ├── shell.yml
│       │   ├── tools.yml
│       │   ├── dotfiles.yml
│       │   ├── terminfo.yml
│       │   └── mise_tools.yml
│       ├── vars/
│       │   └── main.yml     # Tool URLs and computed variables
│       └── files/
│           └── xterm-ghostty.terminfo
└── molecule/
    └── default/
        ├── molecule.yml     # Molecule configuration (Docker driver)
        ├── converge.yml     # Applies the roles
        └── verify.yml       # Validates the desired state
```

## Prerequisites

### SSH Agent

Before running the playbook, ensure your SSH keys are loaded into the local agent:

```bash
# Check loaded keys
ssh-add -l

# If empty, add your key
ssh-add ~/.ssh/id_ed25519
```

This is required for dotfiles cloning via SSH agent forwarding.

## Usage

The `target_user` variable defaults to the SSH connection user. Override it to provision a different user.

Provision a user account:

```bash
ansible-playbook playbook.yml -i "myhost.example.com,"
```

Provision the root account:

```bash
ansible-playbook playbook.yml -i "myhost.example.com," -e target_user=root
```

## Configuration

Settings are configured in `ansible.cfg`:
- **SSH Agent Forwarding**: Allows remote hosts to use your local SSH keys for git operations
- **Pipelining**: Reduces SSH round-trips for faster execution
- **ControlMaster/ControlPersist**: Reuses SSH connections
- **become_flags**: Preserves `SSH_AUTH_SOCK` when switching users

To update tool versions, edit `group_vars/all.yml`:

```yaml
fzf_version: "0.66.0"
neovim_version: "0.11.5"
aqua_installer_version: "4.0.2"
```

## Testing

This repository uses [Molecule](https://ansible.readthedocs.io/projects/molecule/) with Docker for testing. On macOS, [OrbStack](https://orbstack.dev/) is recommended as a drop-in Docker Desktop replacement with superior performance.

### Setup

Install test dependencies:

```bash
pip install -r requirements.txt
```

Or with uv:

```bash
uv pip install -r requirements.txt
```

### Workflow

1. **Create** - Boot the test container:
   ```bash
   molecule create
   ```

2. **Converge** - Apply roles to the test instance:
   ```bash
   molecule converge
   ```

3. **Verify** - Validate the desired state was achieved:
   ```bash
   molecule verify
   ```

4. **Login** - Debug by entering the test instance:
   ```bash
   molecule login
   ```

5. **Destroy** - Tear down the test instance:
   ```bash
   molecule destroy
   ```

6. **Test** - Run the full lifecycle (create, converge, verify, destroy):
   ```bash
   molecule test
   ```

### Verification Checks

The verify playbook validates:
- All tool binaries exist and are executable (uv, nvim, fzf, mise, rustup, aqua, atuin)
- Mise global configuration was created
- Dotfiles `.git` directory exists in home
- Zsh is set as the default shell
- Kitty and Ghostty terminfo are installed

### OrbStack Benefits

When using OrbStack on macOS:
- **Fast iteration**: Low overhead means frequent create/destroy cycles won't overheat your Mac
- **Rosetta emulation**: Test x86_64 binaries on Apple Silicon by adding `platform: linux/amd64` to molecule.yml
- **Seamless Docker compatibility**: Works with standard Docker driver configuration

## OrbStack

To run against an OrbStack machine:

```bash
ansible-playbook playbook.yml -i "$(orb -m "${machine}" whoami)@${machine}.orb.local,"
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
