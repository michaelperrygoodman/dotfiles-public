#// List all available blackarch packages
sudo pacman -Sgg | awk '{print $1}' | cut -d ' ' -f2 | sort -u

