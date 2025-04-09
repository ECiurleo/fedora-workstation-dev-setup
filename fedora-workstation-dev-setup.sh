## Update the system before starting
echo "Updating system..."
sudo dnf -y update
sudo dnf -y upgrade
echo "System update complete."

## Enable RPM Fusion (non-free)
echo "Adding RPM Fusion."
sudo dnf -y install \
  https://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm
sudo dnf -y config-manager --enable fedora-cisco-openh264 
sudo dnf -y update --refresh
echo "Added RPM Fusion."

## Make a temp folder for Downloads
echo "Creating temporary folder for Downloads..."
mkdir -p ~/Downloads/fedora-workstation-dev-setup-temp
cd ~/Downloads/fedora-workstation-dev-setup-temp
echo "Temporary folder created."

## Install Edge
sudo rpm --import https://packages.microsoft.com/keys/microsoft.asc
sudo dnf -y config-manager --add-repo https://packages.microsoft.com/yumrepos/edge
sudo dnf -y install microsoft-edge-stable
echo "Edge installed."

## Install Docker Desktop
echo "Installing Docker Desktop..."
sudo dnf -y install github-desktop
sudo dnf -y install dnf-plugins-core wget
sudo dnf -y config-manager --add-repo https://download.docker.com/linux/fedora/docker-ce.repo
sudo dnf -y install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin gnome-terminal
wget https://desktop.docker.com/linux/main/amd64/145265/docker-desktop-4.29.0-x86_64.rpm
sudo dnf -y install ./docker-desktop-4.29.0-x86_64.rpm
echo "Docker Desktop installed."

# Add current user to the docker group
echo "Adding current user to Docker group..."
sudo usermod -aG docker $USER
echo "User added to Docker group."

## Install Microsoft VScode
echo "Installing Microsoft VSCode..."
sudo rpm --import https://packages.microsoft.com/keys/microsoft.asc
sudo sh -c 'echo -e "[code]\nname=Visual Studio Code\nbaseurl=https://packages.microsoft.com/yumrepos/vscode\nenabled=1\ngpgcheck=1\ngpgkey=https://packages.microsoft.com/keys/microsoft.asc" > /etc/yum.repos.d/vscode.repo'
sudo dnf -y install code # or code-insiders
echo "Microsoft VSCode installed."

## Github Desktop
echo "Installing GitHub Desktop..."
sudo rpm --import https://rpm.packages.shiftkey.dev/gpg.key
sudo sh -c 'echo -e "[shiftkey-packages]\nname=GitHub Desktop\nbaseurl=https://rpm.packages.shiftkey.dev/rpm/\nenabled=1\ngpgcheck=1\nrepo_gpgcheck=1\ngpgkey=https://rpm.packages.shiftkey.dev/gpg.key" > /etc/yum.repos.d/shiftkey-packages.repo'
sudo dnf -y install github-desktop
echo "GitHub Desktop installed."

echo "GitHub CLI installing...."
sudo dnf -y install 'dnf-command(config-manager)'
sudo dnf -y config-manager --add-repo https://cli.github.com/packages/rpm/gh-cli.repo
sudo dnf -y install gh
echo "GitHub CLI installed."

## Lens Desktop
echo "Installing Lens Desktop..."
sudo dnf config-manager --add-repo https://downloads.k8slens.dev/rpm/lens.repo
sudo dnf -y install lens
echo "Lens Desktop installed."

## Azure Cli
echo "Installing Azure CLI..."
sudo rpm --import https://packages.microsoft.com/keys/microsoft.asc
sudo dnf install -y https://packages.microsoft.com/config/rhel/9.0/packages-microsoft-prod.rpm
sudo dnf -y install azure-cli
echo "Azure CLI installed."

## AWS cli
echo "Installing AWS CLI..."
curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
unzip awscliv2.zip
sudo ./aws/install
echo "AWS CLI installed."

## Ansible
echo "Installing Ansible and plugins..."
sudo dnf -y install ansible
sudo dnf -y install python3-pip
pip3 install kubernetes
ansible-galaxy collection install community.kubernetes
echo "Ansible and plugins installed."

## Terraform
echo "Installing Terraform..."
sudo dnf install -y dnf-plugins-core
sudo dnf config-manager --add-repo https://rpm.releases.hashicorp.com/fedora/hashicorp.repo
sudo dnf -y install terraform
echo "Terraform installed."

## MySQL client
echo "Installing MySQL client..."
sudo dnf -y install mysql
sudo dnf -y install jq
echo "MySQL client installed."


## Install Kubernetes Kubectl CLI and K9s
echo "Installing Kubernetes Kubectl CLI and K9s..."
# Kubectl
cat <<EOF | sudo tee /etc/yum.repos.d/kubernetes.repo
[kubernetes]
name=Kubernetes
baseurl=https://pkgs.k8s.io/core:/stable:/v1.29/rpm/
enabled=1
gpgcheck=1
gpgkey=https://pkgs.k8s.io/core:/stable:/v1.29/rpm/repodata/repomd.xml.key
EOF
sudo dnf -y install -y kubectl
# Helm
sudo dnf -y install helm
helm plugin install https://github.com/databus23/helm-diff

# k9s
sudo dnf -y copr enable emanuelec/k9s
sudo dnf -y install k9s
echo "Kubernetes Kubectl CLI and K9s installed."

## Update the system and clean up
echo "Final system update and cleanup..."
sudo dnf -y update
echo "System update and cleanup complete."

## Clean up temp
echo "Cleaning up temporary folder..."
cd ~/Downloads  # Change back to the original directory
rm -r fedora-workstation-dev-setup-temp
echo "Temporary folder deleted."

## Enable flathub
flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo

## Install Flatpaks
echo "Installing Flatpaks..."
# Yubikey Authenticator
sudo flatpak -y install flathub com.yubico.yubioath
echo "Installed Flatpaks."

## Install Gnome Tweaks/Extentions
# echo "Installing Gnome Tweaks/Extentions."
# sudo dnf -y install gnome-tweaks
# sudo flatpak -y install flathub org.gnome.Extensions
# echo "Installed Gnome Tweaks/Extentions."

## Install Chat Apps
echo "Installing Chat Apps..."
# Slack
sudo flatpak -y install flathub com.slack.Slack
# Zoom
sudo flatpak -y install flathub us.zoom.Zoom
# Teams
sudo flatpak -y install flathub com.github.IsmaelMartinez.teams_for_linux
# Telegram
sudo flatpak -y install flathub org.telegram.desktop
echo "Installed Chat Apps."

## Install Fun Stuff
echo "Installing Fun Apps."
# Steam
sudo dnf -y install steam 
# Spotify
flatpak install flathub com.spotify.Client
echo "Installed Fun Apps."

echo "Setup complete."
