set t_Co=256 " soporte para 256 colores

set nocompatible              " be iMproved, required
set history=1000              " tamaño del history

filetype plugin indent on     " activar plugin indent y filetype de vim

"https://robertbasic.com/blog/force-python-version-in-vim/
if has('python3') " soporte por defecto a python3
endif

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" plugin plus
Plugin 'scrooloose/nerdtree'              " Navegar Entre Ficheros
Plugin 'formatcom/vim-gitgutter'          " Git Status por archivo
Plugin 'tpope/vim-fugitive'               " Git Branch Info
Plugin 'vim-airline'                      " Barra de estado vim
Plugin 'davidhalter/jedi-vim'		  " Autocompletado para python3
Plugin 'Valloric/YouCompleteMe'           " Autocompletado
Plugin 'kien/ctrlp.vim'                   " con ctrl+P buscamos archivos de forma rapida
Plugin 'tagbar'				  " Busca donde se creo dicha funcion que estoy utilizando
Plugin 'ntpeters/vim-better-whitespace'   " Pinta los espacios en blanco
Plugin 'mattn/emmet-vim'                  " emmet vim
Plugin 'terryma/vim-multiple-cursors'    " Multiple Cursors, ¡edita varias zonas del fichero a la vez!

" Plugin languages
Plugin 'pangloss/vim-javascript'
Plugin 'maxmellon/vim-jsx-pretty'
Plugin 'vim-coffee-script'
Plugin 'vim-stylus'
Plugin 'jade.vim'
Plugin 'django.vim'
Plugin 'lgeorget/maude.vim'

" Plugin colors
Plugin 'molokai'

" All of your Plugins must be added before the following line
call vundle#end()            " required

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
" source $VIMRUNTIME/filetype.vim " fix filetype ya no es necesario

set noswapfile          " desactivar swapfile
set nobackup            " desactivar el backup, para eso utilizamos git
set nowrap              " no romper las lineas largas
set encoding=utf-8      " siempre utilizar utf-8

set shiftwidth=2
set tabstop=2

au Filetype c          setlocal shiftwidth=4 tabstop=4
au Filetype cpp        setlocal shiftwidth=4 tabstop=4
au Filetype html       setlocal shiftwidth=2 tabstop=2
au Filetype htmldjango setlocal shiftwidth=2 tabstop=2
au Filetype yaml       setlocal shiftwidth=2 tabstop=2
au Filetype javascript setlocal shiftwidth=2 tabstop=2
au Filetype maude      setlocal shiftwidth=2 tabstop=2
au FileType python     setlocal shiftwidth=4 softtabstop=4 expandtab

set foldmethod=manual               " activar soporte a folding metodo manual
au BufWinLeave ?* mkview            " al salir crea la view para persistir el folding
au BufWinEnter ?* silent loadview   " al entrar carga la view para persistir el folding


" ================
" COLORS AND UI
" ================

set cursorline          " pintar linea en la posicion actual
set laststatus=2        " muestra la statusbar
set number              " mostrar el numero de la linea
set relativenumber	" se utiliza numeros relativos
set showmatch           " higlight matching () y []
"set paste               " disabled auto-indenting

set listchars=tab:→\ ,space:·,nbsp:␣,trail:•,eol:¶,precedes:«,extends:»   " Mostrar caracteres especiales
set nolist

silent! color molokai

" =====================
" MISCELLANEOUS
" =====================

nmap <F2> :NERDTree<cr>
nmap <F3> :NERDTreeClose<cr>
nmap <C-t> :NERDTreeToggle<CR>

let g:NERDTreeDirArrowExpandable = '+'
let g:NERDTreeDirArrowCollapsible = '-'
let g:NERDTreeWinSize=20
let g:tagbar_width=20

function! ToggleRelativeNumber()
  if &relativenumber == 1
    set norelativenumber
  else
    set relativenumber
  endif
endfunction

nmap <F8> :TagbarToggle<CR>
nmap <F4> :call ToggleRelativeNumber()<CR>
imap <F4> <Esc>:call ToggleRelativeNumber()<CR>

map <Leader>gpyt :!ctags -R --python-kinds=-i --exclude=.git .<CR><CR>
map <Leader>gt :!ctags -R --exclude=.git .<CR><CR>
map <Leader>tn :tnext<CR>
map <Leader>tp :tprevious<CR>

map <Leader>Y :call system("xclip -i -selection clipboard", getreg("\""))<CR>
map <Leader>P :call setreg("\"", system("xclip -o -selection clipboard"))<CR>p

map <Leader>y :call system("xclip -i", getreg("\""))<CR>
map <Leader>p :call setreg("\"", system("xclip -o"))<CR>p
