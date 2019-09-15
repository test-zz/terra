#!/bin/sh
touch ~/.vimrc
echo 'colo evening' >> ~/.vimrc
echo 'syntax on' >> ~/.vimrc
echo 'set backspace=indent,eol,start' >> ~/.vimrc
terraform init
ssh-keygen -t rsa -f ~/.ssh/$(whoami) -C $(whoami) -q -N ""

pushd ..
git clone https://github.com/dcanadillas/jenkins-x-workshop.git
#https://github.com/cloudbees-days/jenkins-x-workshop
popd
