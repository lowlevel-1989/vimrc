## Instalar
~~~
$ git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
$ cp vimrc ~/.vimrc
$ vim +PluginInstall +qall
$ cd .vim/bundle/YouCompleteMe
$ python3 run_tests.py
$ python3 install.py --all
~~~

~~~
modo normal  <C-P>           Buscar archivo
modo normal  <F8>            TagBar
modo normal  <F4>            ToggleRelativeNumber
modo normal  <C-t>           NERDTree
modo normal  <C-]>           Buscar in Ctag
modo normal  \gpyt           Generar map ctag python, preferiblemente en la raiz del proyecto
modo normal  \gt             Generar map ctag, preferiblemente en la raiz del proyecto
modo normal  \tn             tag next
modo normal  \tp             tag prev
modo normal  <F8>            tagbar

modo normal  <vip>           Seleciona todo el parrafo en modo view
modo view    <zf>            Comprimir en una linea
modo view    <za>            Expandir 

modo insert  <C-y>,          html:5 emmet

modo comando <:set paste>
modo comando <:set nopaste>

modo normal  <C-e>           Scroll abajo
modo normal  <C-y>           Scroll arriba

---- copiar del buffer al xclip -----------

\y   copiar al xclip
\p   pegar desde xclip

\Y   copiar al xclip -> clipboard
\P   pegar desde clipboard

---- registros -------
"%        contiene el nombre del archivo
"#        contiene el nombre del archivo buffer alternativo

Registro de expresión
"=2+2<Enter>                Si deseas pegar el resultado presiona p

"ayy copia la lina actual al registro a

"ap pega el contenido del registro a

solo un _ guion bajo que es el registro a blackhole

"__dd eliminar linea y enviar el contenido a null

------- misc -------------

:e newfile

:%s/foo/bar/g  reemplazar

------- multicursor ------

<C-n> iniciar multicursor
<C-n> siguiente
<C-x> saltar el siguiente
<C-p> anterior

-------- tabs ------------

:tabnew

0gt     ir al tab 0
1gt     ir al tab 1
.
.
.
9gt     ir al tab 9 

gt      tab siguiente
gT      tab previo

----------- split -----------

horizontal

:split

vertical

:vs

cambiar tama;o

horizontal

:resize 40

vertical

:vertical resize 10

---- text objects

w - words
s - sentences
p - paragraphs
t - tags

---- motions

a - all
i - in
t - til
f - find forward
F - find backward

---- commands

d - delete (also cut)
c - change (delete, then place in insert mode)
y - yank (copy)
v - visually select

{command}{text object or motion}
~~
