#!/bin/sh

###########################################################################
###                              ...AUTOR...                            ###
###                           Vinicio Valbuena                          ###
###########################################################################
###                           ...INFORMACION...                         ###
### SABER NUMEROS DE NUCLEOS -> grep processor /proc/cpuinfo | wc -l    ###
###########################################################################
###                           ...INSTALACION...                         ###
### UBUNTU -> ./install.sh ~ plus                                       ###
###           sudo ./install.sh ~ youCompleteMe 2 ubuntu                ###
### FEDORA -> ./install.sh ~ plus                                       ###
###           sudo ./install.sh ~ youCompleteMe 2 fedora                ###
###########################################################################

HOME=$1
YOUCOMPLETEME=$2
CORES=$3
DISTRO=$4

if [ "$YOUCOMPLETEME" = 'youCompleteMe' ]; then

  if [ "$DISTRO" = 'fedora' ]; then
    dnf install automake gcc gcc-c++ kernel-devel cmake
    dnf install -y python-devel python3-devel
  fi

  if [ "$DISTRO" = 'ubuntu' ]; then
    apt-get install -fs build-essential cmake3
    apt-get install -fs python-dev python3-dev
  fi

  git clone https://github.com/Valloric/YouCompleteMe.git $HOME/.vim/bundle/YouCompleteMe

  cd $HOME/.vim/bundle/YouCompleteMe
  git submodule update --init --recursive
  YCM_CORES=$CORES python install.py --clang-completer --tern-completer
else

  git clone https://github.com/VundleVim/Vundle.vim.git $HOME/.vim/bundle/Vundle.vim

  if [ "$YOUCOMPLETEME" = 'plus' ]; then
    cp vimrcx $HOME/.vimrc
  else
    cp vimrc $HOME/.vimrc
  fi

  vim +PluginInstall +qall

fi
