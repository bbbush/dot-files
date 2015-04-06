" vim:expandtab shiftwidth=2 tabstop=8 textwidth=72

" Based on Wu Yongwei's _vimrc for Vim 7 (2008-06-23)

if v:version < 700
  echoerr 'This _vimrc requires Vim 7 or later.'
  quit
endif

if has('autocmd')
  " Remove ALL autocommands for the current group
  au!
endif

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
if has('gui_running')
  source $VIMRUNTIME/vimrc_example.vim
  source $VIMRUNTIME/mswin.vim
  behave mswin
endif

" Personal flavor
set ai
set nu tw=78 sw=2 ts=4
" set et  " expandtab when hit 'Tab' key, should set in individual files
set wildmenu
set dir=c:\temp,c:\tmp,/cygdrive/c/temp,/c/temp,. " for different environment
set backupdir=c:\temp,c:\tmp,/cygdrive/c/temp,/c/temp,. " for different environment
set list listchars=trail:·,tab:»·

" Non-GUI setting
if !has('gui_running')
  " Set text-mode menu
  if has('wildmenu')
    set wildmenu
    set cpoptions-=<
    nmap <F10>      :emenu <C-Z>
    imap <F10> <C-O>:emenu <C-Z>
  endif
  set t_Co=256
endif

" GUI settings
if has('gui_running')
  " Always show file types in menu
  let do_syntax_sel_menu=1
  set guifont=Luxi_Mono:h10
  set lines=35
  set columns=120
  set guioptions-=T
  colorscheme darkblue
  if has("win32")
    let g:visual_studio_python_exe = "D:/Python25/pythonw.exe"
  endif
  filetype indent on
endif

" Set British spelling convention for International English
if has('syntax')
  set spelllang=en_gb
endif

" Key mappings to ease browsing long lines
noremap  <C-J>         gj
noremap  <C-K>         gk
inoremap <M-Home> <C-O>g0
inoremap <M-End>  <C-O>g$

" Complex Key mappings, etc.
if has('eval')
  " Function to switch the cursor position between the first column and the
  " first non-blank column
  function! GoToFirstNonBlankOrFirstColumn()
    let cur_col=col('.')
    normal! ^
    if cur_col != 1 && cur_col == col('.')
      normal! 0
    endif
  endfunction

  " Key mappings to make Home go to first non-blank column or first column
  nnoremap <silent> <Home>      :call GoToFirstNonBlankOrFirstColumn()<CR>
  inoremap <silent> <Home> <C-O>:call GoToFirstNonBlankOrFirstColumn()<CR>

    " Function to insert the current date
  function! InsertCurrentDate()
    let curr_date=strftime('%Y-%m-%d', localtime())
    silent! exec 'normal! gi' .  curr_date . "\<ESC>l"
  endfunction

  " Key mapping to insert the current date
  inoremap <silent> <C-\><C-D> <C-O>:call InsertCurrentDate()<CR>
endif

" plugins https://github.com/tpope/vim-pathogen
if has('gui_running')
  set nocompatible
  filetype off
  execute pathogen#infect()

" Vundle.vim plugins https://github.com/gmarik/Vundle.vim
  set nocompatible
  filetype off
  call vundle#begin()
  " let Vundle manage Vundle, required
  Plugin 'gmarik/Vundle.vim'
  call vundle#end()

" required after plugin settings
  syntax on
  filetype plugin indent on
endif

" config vim-jsbeautify https://github.com/maksimr/vim-jsbeautify
if has('gui_running')
  "map <c-f> :call JsBeautify()<cr>
  autocmd FileType javascript noremap <buffer> <c-f> :call JsBeautify()<cr>
  autocmd FileType html noremap <buffer> <c-f> :call HtmlBeautify()<cr>
  autocmd FileType css noremap <buffer> <c-f> :call CSSBeautify()<cr>
  "autocmd FileType javascript vnoremap <buffer>  <c-f> :call RangeJsBeautify()<cr>
  "autocmd FileType html vnoremap <buffer> <c-f> :call RangeHtmlBeautify()<cr>
  "autocmd FileType css vnoremap <buffer> <c-f> :call RangeCSSBeautify()<cr>
endif

