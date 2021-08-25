#!/usr/bin/env bash

set -e

touch ~/.bash_load
echo "source ~/.bash_load" >> ~/.bashrc
echo "source ~/.bash_load" >> ~/.bash_profile

sudo apt update
sudo apt upgrade -y

sudo apt install -y gcc make autoconf bison build-essential libssl-dev libyaml-dev libreadline6-dev zlib1g-dev libncurses5-dev libffi-dev libgdbm5 libgdbm-dev rbenv

git clone https://github.com/rbenv/rbenv.git ~/.rbenv
echo 'export PATH="$HOME/.rbenv/bin:$PATH"' >> ~/.bash_load
echo 'eval "$(rbenv init -)"' >> ~/.bash_load

git clone https://github.com/rbenv/ruby-build.git ~/.rbenv/plugins/ruby-build

sudo apt install -y terminator tmux htop

sudo snap install --classic code

source ~/.bash_load

rbenv install 3.0.2
rbenv global 3.0.2
gem install bundler
