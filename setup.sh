#!/bin/bash

if [ ! -f ~/.vimrc ]; then
  echo Updating .vimrc...
  touch ~/.vimrc
  echo 'colo evening' >> ~/.vimrc
  echo 'syntax on' >> ~/.vimrc
  echo 'set backspace=indent,eol,start' >> ~/.vimrc
else
  echo Skipped .vimrc update
fi

if [ ! -f ~/.ssh/$(whoami) ]; then
  echo Generating ssh key...
  ssh-keygen -t rsa -f ~/.ssh/$(whoami) -C $(whoami) -q -N ""
else
  echo Skipped ssh-keygen
fi

terraform init

pushd ..
if [ ! -e jenkins-x-workshop ]; then
  git clone https://github.com/dcanadillas/jenkins-x-workshop.git
  #https://github.com/cloudbees-days/jenkins-x-workshop
else
  echo Skipped git clone
fi
popd
