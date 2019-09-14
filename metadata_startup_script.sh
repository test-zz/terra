#!/bin/sh
# https://www.digitalocean.com/community/tutorials/how-to-install-and-configure-vnc-on-ubuntu-18-04
sudo apt update -y
sudo apt upgrade -y
sudo apt install -y xfce4 xfce4-goodies expect
sudo apt install -y tightvncserver

prog=/usr/bin/vncpasswd
mypass="qwertyui"
/usr/bin/expect <<EOF
spawn "$prog"
expect "Password:"
send "$mypass\r"
expect "Verify:"
send "$mypass\r"
expect "Would you like to enter a view-only password (y/n)?"
send "n\r"
expect eof
exit
EOF

vncserver

git clone https://github.com/test-zz/noVNC.git
cd noVNC
sudo apt install -y python
openssl req -x509 -newkey rsa:4096 -keyout key.pem -out self.pem -days 365 -subj '/CN=localhost' -nodes
sudo ./utils/launch.sh --vnc localhost:5901 --listen 443
