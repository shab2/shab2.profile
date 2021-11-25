" wiki
" https://i-notes.org/vimtutor-uchebnik-vim-versiya-1-7/ - tutor rus
" https://r-notes.ru/administrirovanie/poleznosti/149-rukovodstvo-polzovatelya-vim-bram-moolenaar.html - дока Муленара на русском
" https://stackoverflow.com/questions/30337281/what-is-the-difference-between-vimrc-and-vimruntime
" https://gist.github.com/novusnota/65dcc593df6d9909ffb59eb83fe69a28 - extented vimrc

" new at 26.10.2021
"   scriptsnames
"   version
"   mouse=a (nvih)

" оставляем дефолтные настройки для Debian
unlet! skip_defaults_vim
let fdef=$VIMRUNTIME."/defaults.vim"
if filereadable(expand(fdef))
   ": echo fdef
   source $VIMRUNTIME/defaults.vim
else
   ": echo fdef
endif

" здесь новые настройки

"set mouse=nvi          " разрешаем работать мышкой во всех режимах кроме командного, командный оставляем для копирования блока в системный clipboard
                       " shift-lclick - copy syscl, shift-insert или shift-rclick - paste, Y - copy from visual mode, P - paste
set paste              " отключаем всю умность вима при вставке из памяти, автоотступ при комментариях например. В дебиане включено в defaults.vim
set virtualedit=all    " разрешает выделять вертикальный блок начиная с пустого места

autocmd BufRead,BufNewFile * if &filetype == '' | set ft=sh | end  "файлы c неопределенным типом показывать как командные

"" tabs are to be set at 2 spaces
set tabstop=2
set shiftwidth=2
set smarttab
set expandtab
"set smartindent

set viminfo=%,<1000,'10,/50,:100,h,f0,n~/.viminfo
"           | |     |   |   |    | |  + viminfo file path
"           | |     |   |   |    | + file marks 0-9,A-Z 0=NOT stored
"           | |     |   |   |    + disable 'hlsearch' loading viminfo
"           | |     |   |   + command-line history saved
"           | |     |   + search history saved
"           | |     + files marks saved
"           | + lines saved each register (old name for <, vi6.2)
"           + save/restore buffer list

" перемещаем выделенный блок не выходя из выделения Control+Shift+стрелки
if version >= 690
  xnoremap <C-S-Up> xkP`[V`]
  xnoremap <C-S-Down> xp`[V`]
  xnoremap <C-S-Left> <gv
  xnoremap <C-S-Right> >gv
endif

" allow us to backspace before an insert
"set backspace=2
" show the ruler for editing
set ruler
" turn off the mouse in the xterm
"setmouse=a
" show the command in the status line
set showcmd
" always have a status line
set laststatus=2

set nobackup        " Don't keep a backup file

"set path=.,~/Documents,/var/www/,$VIMRUNTIME/syntax/
"highlight   term=underline ctermfg=3 guifg=yellow3
highlight PreProc   term=underline cterm=bold ctermfg=2 gui=bold guifg=green1
" this clears out the old colors before we begin
"highlight Constant    NONE
"highlight Delimiter   NONE
"highlight Directory   NONE
"highlight Error       NONE
"highlight ErrorMsg    NONE
"highlight Identifier  NONE
"highlight LineNr      NONE
"highlight ModeMsg     NONE
"highlight MoreMsg     NONE
"highlight Normal      NONE
"highlight NonText     NONE
"highlight PreProc     NONE
"highlight Question    NONE
"highlight Search      NONE
"highlight Special     NONE
"highlight SpecialKey  NONE
"highlight Statement   NONE
highlight StatusLine  NONE
"highlight StatusLineNC NONE
"highlight Title       NONE
"highlight Todo        NONE
"highlight Type        NONE
"highlight Visual      NONE
"highlight WarningMsg  NONE
" these are the new superior colors

"highlight Comment     term=bold ctermfg=5 ctermbg=0 guifg=#FF005F guibg=gray
highlight Comment     term=bold ctermfg=2 gui=bold guifg=green3
"highlight Constant    term=underline ctermfg=6 guifg=#FF2f8f
"highlight Delimiter   term=bold cterm=bold ctermfg=1 gui=bold guifg=Red
"highlight Directory   term=bold ctermfg=DarkBlue guifg=Blue
"highlight Error       term=standout cterm=bold ctermbg=1 ctermfg=1 gui=bold guifg=red
"highlight ErrorMsg    term=standout cterm=bold ctermfg=1 gui=bold guifg=red
"highlight Identifier  term=underline ctermfg=3 guifg=yellow3
"highlight LineNr      term=underline cterm=bold ctermfg=3 guifg=Brown
"highlight ModeMsg     term=bold cterm=bold ctermfg=3 ctermbg=1 guifg=yellow2 guibg=red
"highlight MoreMsg     term=bold cterm=bold ctermfg=2 gui=bold guifg=Green
"highlight NonText     term=bold ctermfg=2 guifg=green3
"highlight Normal      ctermfg=white ctermbg=black guifg=grey90 guibg=#000020
"highlight PreProc     term=underline ctermfg=14 guifg=cyan
"highlight Question    term=standout cterm=bold ctermfg=2 gui=bold guifg=Green
"highlight Search      term=reverse ctermbg=2 guibg=Yellow
"highlight Special     term=bold ctermfg=5 guifg=SlateBlue
"highlight SpecialKey  term=bold ctermfg=DarkBlue guifg=Blue
"highlight Statement   term=bold ctermfg=2 gui=bold guifg=green3
highlight StatusLine  term=reverse cterm=bold ctermfg=3 ctermbg=4 guifg=wheat guibg=#2f4f4f
"highlight StatusLineNC term=bold ctermfg=3 ctermbg=2 guifg=#071f1f guibg=#5f9f9f
"highlight Title       term=bold cterm=bold ctermfg=4 gui=bold guifg=Blue
"highlight Todo        term=bold ctermfg=red ctermbg=yellow guifg=red guibg=yellow1 gui=bold
"highlight Type        term=underline cterm=bold ctermfg=3 guifg=yellow3 gui=bold
"highlight Visual      term=reverse cterm=bold ctermfg=6 ctermbg=5 guifg=yellow guibg=blue
"highlight WarningMsg  term=standout cterm=bold ctermfg=1 ctermbg=4 guifg=Red

"set encoding=utf-8
"set termencoding=utf-8
set fileencodings=utf-8,cp1251,cp866,koi8-r

" <F7> File fileformat (dos - <CR> <NL>, unix - <NL>, mac - <CR>)
map <F7>        :execute RotateFileFormat()<CR>
vmap <F7>       <C-C><F7>
imap <F7>       <C-O><F7>
let b:fformatindex=0
function! RotateFileFormat()
  let y = -1
  while y == -1
    let encstring = "#unix#dos#mac#"
    let x = match(encstring,"#",b:fformatindex)
    let y = match(encstring,"#",x+1)
    let b:fformatindex = x+1
    if y == -1
      let b:fformatindex = 0
    else
      let str = strpart(encstring,x+1,y-x-1)
      return ":set fileformat=".str
    endif
  endwhile
endfunction

" <F8> File encoding for open
" ucs-2le - MS Windows unicode encoding
map <F8>        :execute RotateEnc()<CR>
vmap <F8>       <C-C><F8>
imap <F8>       <C-O><F8>
let b:encindex=0
function! RotateEnc()
  let y = -1
  while y == -1
    let encstring = "#koi8-r#cp1251#8bit-cp866#utf-8#ucs-2le#"
    let x = match(encstring,"#",b:encindex)
    let y = match(encstring,"#",x+1)
    let b:encindex = x+1
    if y == -1
      let b:encindex = 0
    else
      let str = strpart(encstring,x+1,y-x-1)
      return ":e ++enc=".str
    endif
  endwhile
endfunction

" <Shift+F8> Force file encoding for open (encoding = fileencoding)
map <S-F8>      :execute ForceRotateEnc()<CR>
vmap <S-F8>     <C-C><S-F8>
imap <S-F8>     <C-O><S-F8>
let b:encindex=0
function! ForceRotateEnc()
  let y = -1
  while y == -1
    let encstring = "#koi8-r#cp1251#8bit-cp866#utf-8#ucs-2le#"
    let x = match(encstring,"#",b:encindex)
    let y = match(encstring,"#",x+1)
    let b:encindex = x+1
    if y == -1
      let b:encindex = 0
    else
      let str = strpart(encstring,x+1,y-x-1)
      :execute "set encoding=".str
      return ":e ++enc=".str
    endif
  endwhile
endfunction

" <Ctrl+F8> File encoding for save (convert)
map <C-F8>      :execute RotateFEnc()<CR>
vmap <C-F8>     <C-C><C-F8>
imap <C-F8>     <C-O><C-F8>
let b:fencindex=0
function! RotateFEnc()
  let y = -1
  while y == -1
    let encstring = "#koi8-r#cp1251#8bit-cp866#utf-8#ucs-2le#"
    let x = match(encstring,"#",b:fencindex)
    let y = match(encstring,"#",x+1)
    let b:fencindex = x+1
    if y == -1
      let b:fencindex = 0
    else
      let str = strpart(encstring,x+1,y-x-1)
      return ":set fenc=".str
    endif
  endwhile
endfunction

set statusline=%<%f%h%m%r%=format=%{&fileformat}\ file=%{&fileencoding}\ enc=%{&encoding}\ %b\ 0x%B\ %l,%c%V\ %P
