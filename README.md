# Fedora Workstation Development Setup

This script automates the installation of various development tools and applications on a Fedora workstation.

## Prerequisites

Ensure you have sudo privileges.

## What This Script Does

1. Updates the system.
2. Enables RPM Fusion (non-free) repository.
3. Creates a temporary folder for downloads.
4. Installs the following software:
   - Microsoft Edge
   - Docker Desktop
   - JetBrains Toolbox
   - Microsoft Visual Studio Code
   - GitHub Desktop
   - GitHub CLI
   - Azure CLI
   - AWS CLI
   - Ansible and plugins
   - Terraform
   - MySQL client
   - Kubernetes Kubectl CLI
   - Helm
   - K9s
   - Various Flatpak applications (Yubikey Authenticator, Logitech Controller)
   - Gnome Tweaks and Extensions
   - Chat applications (Slack, Zoom, Teams, Telegram)
   - Steam
   - sshuttle

5. Cleans up temporary files and performs a final system update.

## Usage

1. Clone this repository or download the script file.
2. Open a terminal and navigate to the directory containing the script.
3. Make the script executable:
    ```bash
    chmod +x fedora-workstation-dev-setup.sh
    ```
4. Run the script:
    ```bash
    ./fedora-workstation-dev-setup.sh
    ```

