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
    dnf install -y automake gcc gcc-c++ kernel-devel
    dnf install -y python-devel
  fi

  if [ "$DISTRO" = 'ubuntu' ]; then
    apt-get install -fs build-essential 
    apt-get install -fs python-dev
  fi

  git clone https://github.com/Valloric/YouCompleteMe.git $HOME/.vim/bundle/YouCompleteMe

  wget https://cmake.org/files/v3.4/cmake-3.4.3.tar.gz
  tar -xzvf cmake-3.4.3.tar.gz
  rm -f cmake-3.4.3.tar.gz
  cd cmake-3.4.3
  ./configure
  make
  make install
  cd ..
  rm -rf cmake-3.4.3

  cd $HOME/.vim/bundle/YouCompleteMe
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
