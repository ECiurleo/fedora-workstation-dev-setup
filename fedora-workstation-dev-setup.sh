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



# Clean up temp 
rm -r Downloads/fedora-workstation-dev-setup-temp
