#!/usr/bin/env bash

echo "Install some packages on APT"

sudo apt update >> /dev/null 2>&1 && sudo apt upgrade -y >> /dev/null 2>&1 && \
    sudo apt install -y cmake make curl build-essential \
    git fzf ripgrep clang jq net-tools \
    python3-pip python3-dev gdb >> /dev/null 2>&1 && \
    sudo apt autoremove -y >> /dev/null 2>&1 && \
    sudo apt autoclean >> /dev/null 2>&1

sudo add-apt-repository ppa:lazygit-team/release -y >> /dev/null 2>&1 && \
    sudo apt-get update >> /dev/null 2>&1 && \
    sudo apt-get install lazygit >> /dev/null 2>&1

echo "Install vim-plug"

curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
        https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim >> /dev/null 2>&1

if which node >> /dev/null 2>&1
then
    echo "Node is installed, skipping..."
else
    curl -sL install-node.now.sh/lts | bash
fi

echo "Moving .vimrc to your home path"

cp ./.vimrc ~/
cp ./coc-settings.json ~/.vim

echo "Now, open your ~/.vimrc with vim and run :PlugInstall"
