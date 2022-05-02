sudo apt-get update
sudo apt-get upgrade -y
sudo apt install i3 i3blocks i3lock i3status -y
sudo apt install dunst feh -y
sudo apt install arandr lxappearance neofetch -y
sudo apt install rofi stow -y
sudo apt install zsh -y
sudo apt install htop -y
sudo apt install git -y
REQUIRED_PKG="git"
PKG_OK=$(dpkg-query -W --showformat='${Status}\n' $REQUIRED_PKG|grep "install ok installed")
echo Checking for $REQUIRED_PKG: $PKG_OK
if [ "" != "$PKG_OK" ]; then
    echo "Package $REQUIRED_PKG installed, setting configs..."
    git config --global user.name "Adrian Hernandez"
    git config --global user.email "ad24.ra12@gmail.com"
    git config --global color.ui auto
else
    echo "There's been an error installing $REQUIRED_PKG"
fi
