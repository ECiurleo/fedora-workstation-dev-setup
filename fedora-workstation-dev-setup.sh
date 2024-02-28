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

## Github Desktop
sudo rpm --import https://rpm.packages.shiftkey.dev/gpg.key
sudo sh -c 'echo -e "[shiftkey-packages]\nname=GitHub Desktop\nbaseurl=https://rpm.packages.shiftkey.dev/rpm/\nenabled=1\ngpgcheck=1\nrepo_gpgcheck=1\ngpgkey=https://rpm.packages.shiftkey.dev/gpg.key" > /etc/yum.repos.d/shiftkey-packages.repo'
sudo dnf -y install github-desktop


# Clean up temp 
rm -r Downloads/fedora-workstation-dev-setup-temp
