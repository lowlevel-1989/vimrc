set t_Co=256

set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" plugin plus
Plugin 'Valloric/YouCompleteMe'  " Autocompletado
Plugin 'scrooloose/nerdtree'              " Navegar Entre Ficheros 
Plugin 'vim-gitgutter'                    " Git Status por archivo
Plugin 'tpope/vim-fugitive'               " Git Branch Info
Plugin 'vim-airline'                      " Barra de estado vim

" Plugin languages
Plugin 'vim-javascript'
Plugin 'vim-coffee-script'
Plugin 'vim-stylus'
Plugin 'jade.vim'

" Plugin colors
Plugin 'molokai'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line
"

" ================
" 3. FILE SETTINGS
" ================

" 70s are over and swap files are part of the past.
" If you need to backup something, use Git, for God's sake.
set noswapfile
set nobackup

" Modify indenting settings
set autoindent              " autoindent always ON. 
set expandtab               " expand tabs
set shiftwidth=2            " spaces for autoindentingPS AND FUNCTIONS
" =====================
set softtabstop=2           " remove a full pseudo-TAB when i press <BS>

" Modify some other settings about files
set encoding=utf-8          " always use unicode (god damnit, windows)
set backspace=indent,eol,start " backspace always works on insert mode

" ================
" 5. COLORS AND UI
" ================

set showmode            " always show which more are we in
set laststatus=2        " always show statusbar
set wildmenu            " enable visual wildmenu

set nowrap              " don't wrap long lines
set relativenumber
set showmatch           " higlight matching parentheses and brackets

:silent! color molokai

" =====================
" 6. MAPS AND FUNCTIONS
" =====================

" NERDTree: map ,nt for toggling NERDTree. Faster than the old :NT command
" since I don't have to hold Shift whenever I want to display NERDTree.
" command NT NERDTree     " Legacy. Classy. I didn't know the power of maps
" yet.

nmap <F2> :NERDTree<cr>
nmap <F3> :NERDTreeClose<cr>
nmap <C-n> :NERDTreeToggle<CR>

" :let g:NERDTreeDirArrowExpandable = '+'
" :let g:NERDTreeDirArrowCollapsible = '-'
:let g:NERDTreeWinSize=20
:let g:tagbar_width=20

function! ToggleRelativeNumber()
  if &relativenumber == 1
    set norelativenumber
    set number
  else
    set relativenumber
  endif
endfunction

nmap <F4> :call ToggleRelativeNumber()<CR>
imap <F4> <Esc>:call ToggleRelativeNumber()<CR>a
