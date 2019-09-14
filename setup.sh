#!/bin/sh
touch ~/.vimrc
echo 'colo evening' >> ~/.vimrc
echo 'syntax on' >> ~/.vimrc
echo 'set backspace=indent,eol,start' >> ~/.vimrc
terraform init
ssh-keygen -t rsa -f ~/.ssh/$(whoami) -C $(whoami) -q -N ""
