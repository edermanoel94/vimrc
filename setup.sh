#!/usr/bin/env bash

sudo apt update   && sudo apt upgrade -y   && \
    sudo apt install -y cmake make curl build-essential \
    git fzf ripgrep clang jq net-tools \
    python3-pip python3-dev gdb make libxt-dev libgtk-3-dev libpython3-dev   && \
    sudo apt autoremove -y   && \
    sudo apt autoclean  

sudo add-apt-repository ppa:lazygit-team/release -y   && \
    sudo apt-get update   && \
    sudo apt-get install lazygit  

curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
        https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim  

if which node  
then
    echo "Node is installed, skipping..."
else
    echo "Node is not installed, please install" || exit 1
fi

echo "Moving .vimrc to your home path"

cp ./.vimrc ~/ || exit 1
cp ./coc-settings.json ~/.vim || exit 1

echo "Now, open your ~/.vimrc with vim and run :PlugInstall"
