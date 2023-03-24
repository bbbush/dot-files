" vim:expandtab shiftwidth=2 tabstop=8 textwidth=72
"
" Set encoding before anything else. for example,
" set langmenu=none " must be defined earlier, see help.
if has('multi_byte')
  " Legacy encoding is the system default encoding
  let legacy_encoding=&encoding
  set encoding=utf-8
  set fileencodings=ucs-bom,utf-8,chinese
endif

" Some common setup
set nocompatible
source $VIMRUNTIME/vimrc_example.vim
if !exists("g:syntax_on")
    syntax enable
    filetype on
endif


" Personal flavor
set ai
set nu tw=78 sw=2 ts=4
" set et  " expandtab when hit 'Tab' key, should set in individual files
set wildmenu
set list listchars=trail:·,tab:»·


" Key mappings to ease browsing long lines
noremap  <C-J>         gj
noremap  <C-K>         gk
inoremap <M-Home> <C-O>g0
inoremap <M-End>  <C-O>g$

set backupdir=/tmp//
set directory=/tmp//
set undodir=/tmp//

