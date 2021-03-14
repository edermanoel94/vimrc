#!/usr/bin/sh

sudo apt update && sudo apt upgrade -y && \
    sudo apt install cmake make curl build-essential \
    git fzf ripgrep clang jq net-tools \
    python3-pip python3-dev gdb && \
    sudo apt autoremove -y && \
    sudo apt autoclean

sudo add-apt-repository ppa:lazygit-team/release && \
    sudo apt-get update && \
    sudo apt-get install lazygit

echo "Install vim-plug"

curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
        https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

echo "Installing nodejs for COC"

curl -sL install-node.now.sh/lts | bash

echo "Moving .vimrc to your home path"

mv .vimrc ~/.vimrc

echo "Now, open your ~/.vimrc with vim and run :PlugInstall"
