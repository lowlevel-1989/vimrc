#!/bin/sh
DISTRO=$1
CORES=1

git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
cp .vimrc ~
vim +PluginInstall +qall

if [ "$DISTRO" = 'fedora' ]; then
  dnf install -fs automake gcc gcc-c++ kernel-devel cmake
  dnf install -fs python-devel
else
  apt-get install -fs build-essential 
  apt-get install -fs python-dev
  
  wget https://cmake.org/files/v3.4/cmake-3.4.3.tar.gz
  tar -xzvf cmake-3.4.3.tar.gz
  rm -f cmake-3.4.3.tar.gz
  cd cmake-3.4.3
  ./configure
  make
  make install
  cd ..
  rm -rf cmake-3.4.3
fi

cd ~/.vim/bundle/YouCompleteMe
YCM_CORES=$CORES python install.py --clang-completer --tern-completer
