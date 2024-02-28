## Update the system before starting
sudo dnf -y update

## Make a temp folder for Downloads
mkdir Downloads/fedora-workstation-dev-setup-temp
cd Downloads/fedora-workstation-dev-setup-temp

## Install Docker Desktop
sudo dnf -y install dnf-plugins-core wget
sudo dnf -y config-manager --add-repo https://download.docker.com/linux/fedora/docker-ce.repo
sudo dnf -y install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin gnome-terminal
wget https://desktop.docker.com/linux/main/amd64/139021/docker-desktop-4.28.0-x86_64.rpm
sudo dnf -y install ./docker-desktop-4.28.0-x86_64.rpm

# Add current user to the docker group
sudo usermod -aG docker $USER

## Install Jetbrains Toolbox
wget https://download.jetbrains.com/toolbox/jetbrains-toolbox-2.2.2.20062.tar.gz
sudo tar -xvzf ./jetbrains-toolbox-2.2.2.20062.tar.gz
sudo mv jetbrains-toolbox-2.2.2.20062 /opt/jetbrains
jetbrains/jetbrains-toolbox

## Install Microsoft VScode
sudo rpm --import https://packages.microsoft.com/keys/microsoft.asc
sudo sh -c 'echo -e "[code]\nname=Visual Studio Code\nbaseurl=https://packages.microsoft.com/yumrepos/vscode\nenabled=1\ngpgcheck=1\ngpgkey=https://packages.microsoft.com/keys/microsoft.asc" > /etc/yum.repos.d/vscode.repo'
sudo dnf -y install code # or code-insiders

## Github Desktop
sudo rpm --import https://rpm.packages.shiftkey.dev/gpg.key
sudo sh -c 'echo -e "[shiftkey-packages]\nname=GitHub Desktop\nbaseurl=https://rpm.packages.shiftkey.dev/rpm/\nenabled=1\ngpgcheck=1\nrepo_gpgcheck=1\ngpgkey=https://rpm.packages.shiftkey.dev/gpg.key" > /etc/yum.repos.d/shiftkey-packages.repo'
sudo dnf -y install github-desktop

## Azure Cli
sudo rpm --import https://packages.microsoft.com/keys/microsoft.asc
sudo dnf install -y https://packages.microsoft.com/config/rhel/9.0/packages-microsoft-prod.rpm
sudo dnf -y install azure-cli

## AWS cli
curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
unzip awscliv2.zip
sudo ./aws/install

## Install Kubernetes Kubectl CLI and K9s
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
# k9s
sudo dnf -y copr enable emanuelec/k9s
sudo dnf -y install k9s

## Update the system and clean up
sudo dnf -y update

## ## ## ## ## ## ## ##
## Install Flatpaks
## ## ## ## ## ## ## ##
# Yubikey Authenticator
sudo flatpak -y install flathub com.yubico.yubioath
# Logitech controller
sudo flatpak -y install flathub io.github.pwr_solaar.solaar

## ## ## ## ## ## ## ##
## Install Chat Apps
## ## ## ## ## ## ## ##
# Slack
sudo flatpak -y install flathub com.slack.Slack
# Zoom
sudo flatpak -y install flathub us.zoom.Zoom
# Teams
sudo flatpak -y install flathub com.github.IsmaelMartinez.teams_for_linux
# Telegram
sudo flatpak -y install flathub org.telegram.desktop

# Clean up temp 
rm -r Downloads/fedora-workstation-dev-setup-temp
