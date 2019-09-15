#!/bin/sh
if [ ! -f ~/.vimrc ]; then
  echo Updating .vimrc...
  touch ~/.vimrc
  echo 'colo evening' >> ~/.vimrc
  echo 'syntax on' >> ~/.vimrc
  echo 'set backspace=indent,eol,start' >> ~/.vimrc
fi

if [ ! -f ~/.ssh/$(whoami) ]; then
  echo Generating ssh key...
  ssh-keygen -t rsa -f ~/.ssh/$(whoami) -C $(whoami) -q -N ""
fi

terraform init

pushd '../'

git clone https://github.com/dcanadillas/jenkins-x-workshop.git
#https://github.com/cloudbees-days/jenkins-x-workshop

popd
