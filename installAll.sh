#! /bin/bash

# Shell scrip to install all related programs base on the Linux Opensuse Leap 15.4 distribution and to be
# used in the Wed App Developer Cifo course. This program has to be executed as $root.

#Checking the system arquitecture.
systemArchi=$(unamed -m)
echo "The system architecture is, '$systemArchi'."

# make the repos openSUSE-Leap-15.4-1 and repo-update-non-oss active.
zypper mr -e 1 && zypper mr -e 12

#Install all external and necessary repositories.
#Snappy for IntellJ idea.
zypper addrepo --refresh https://download.opensuse.org/repositories/system:/snappy/openSUSE_Leap_15.4 snappyy
zypper --gpg-auto-import-keys refresh
zypper dup --from snappy
zypper --non-interactive install snapd
systemctl enable --now snapd
#sudo systemctl start snapd
systemctl enable --now snapd.apparmor
#sudo systemctl start snapd.apparmor

#Microsoft.
sudo rpm --import https://packages.microsoft.com/keys/microsoft.asc
sudo zypper addrepo https://packages.microsoft.com/yumrepos/vscode vscode

#Google.
zypper addrepo http://dl.google.com/linux/chrome/rpm/stable/x86_64 Google-Chrome
rpm --import https://dl.google.com/linux/linux_signing_key.pub

# Refresh and update all repositories.
zypper update && zypper refresh

#Install teminator as the main terminal. This app helps to create diferent windows terminals in the same screen.
zypper install -y terminator
terminatorVersion=$(terminator --version 2> /dev/null)
echo "The terminator version installed is: '$terminatorVersion'."

#Install git app.
zypper install -y git
gitVersion=$(git --version 2> /dev/null)
echo "The Git version installed is: '$terminatorVersion'."

#Install JDK ver.11 in case is not alreay installed. Java 11 is being installed
#in OpenSUSE by default.
fileJ=$(readlink -f $(which java))
if [[ -f "$fileJ" ]]
then
    echo "File '$fileJ' is executable and Java is part of the system"
else
   zypper install -y java-11-openjdk
fi

#Install JDK ver.17 and make it the defaul system version and chose which version run as defoult.
zypper --non-interactive install java-17-openjdk-devel
update-alternatives --config java
javaVersion=$(javac --version)
echo "The Java version of your system is: '$javaVersion'."

#Install JDK latest version. TO-DO.

#Istall Apache-maven TO-DO.
zypper --non-interactive install maven
mavenVersion=$(maven --version 2> /dev/null)
echo "The maven version installed is: '$terminatorVersion'."

#Install FlameShot.
zypper --non-interactive install flameshot
flameShotVersion=$(flameshot --version 2> /dev/null)
echo "The Flameshot version installed is: '$flameshotVersion'."

#Install Quarto.
wget https://github.com/quarto-dev/quarto-cli/releases/download/v1.2.280/quarto-1.2.280-linux-amd64.tar.gz
tar -xvzf quarto-1.2.280-linux-amd64.tar.gz -C /opt
ln -s /opt/quarto-1.2.280/bin/quarto /usr/local/bin/quarto
rm -rf quarto-1.2.280-linux-amd64.tar.gz
quartoVersion=$(quarto --version 2> /dev/null)
echo "The Quarto version installed is: '$quartoVersion'."

#Install Docker && Docker Desktop.
zypper --non-interactive install docker
dockerVersion=$(docker --version 2> /dev/null)
echo "The Docker version installed is: '$dockerVersion'."

#Install IntellJ Idea through the snap app.
snap install intellij-idea-ultimate --classic

#Alternative source to install IntelliJ idea
#https://tutorialforlinux.com/2019/05/08/how-to-install-intellij-idea-on-opensuse-15-leap-gnu-linux/
#download the tar.gz file lates is: ideaIU-2022.3.tar.gz
#wget -r --no-parent -A 'ideaIU-2022.3.tar.gz' https://download.jetbrains.com/idea/

#sudo tar -xvzf ~/Downloads/ideaIC-2022.3.tar.gz /opt
#sudo chown -R $USER:$USER /opt/idea
#sudo mv /opt/idea/idea-IC-222.4459.24 /opt/idea/idea
#sudo ln -s /opt/idea/bin/idea.sh /usr/local/bin/idea.sh
#idea.sh

#Install Visual Code.
sudo zypper --non-interactive install code

#Install google chrome.
zypper --non-interactive install google-chrome-stable


#Create a .vimrc with a personal configuration.
./makevimrc.sh
#Edit the .bashrc configuration
# TO DO   ./addConf_bashrc.sh







