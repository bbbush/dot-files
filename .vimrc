" vim:expandtab shiftwidth=2 tabstop=8 textwidth=72

" Based on Wu Yongwei's _vimrc for Vim 7 (2008-06-23)

if v:version < 700
  echoerr 'This _vimrc requires Vim 7 or later.'
  quit
endif

" Personal flavor
set ai
set nu tw=78 sw=2 ts=4
" set et  " expandtab when hit 'Tab' key, should set in individual files
set dir=/tmp,. " for different environment
set backupdir=/tmp,. " for different environment
set list listchars=trail:·,tab:»·

" GUI settings
if has('gui_running')
  " Always show file types in menu
  let do_syntax_sel_menu=1
  set guifont=DejaVu_Sans_Mono_for_Powerline:cANSI
  set lines=35
  set columns=120
  set guioptions-=T
  colorscheme darkblue
  if has("win32")
    let g:visual_studio_python_exe = "D:/Python25/pythonw.exe"
  endif
  filetype indent on
else
  set t_Co=256
  colorscheme darkblue
  set mouse=a
  set nofoldenable
  set foldmethod=indent
  if has('autocmd')
    au FileType c,cpp,hpp setlocal foldmethod=syntax
  endif
  " Set text-mode menu
  if has('wildmenu')
    set wildmenu
    set cpoptions-=<
    nmap <F10>      :emenu <C-Z>
    imap <F10> <C-O>:emenu <C-Z>
  endif
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

if 1
" plugins https://github.com/tpope/vim-pathogen
  set nocompatible
  filetype off
  execute pathogen#infect()

  if 1
" Vundle.vim plugins https://github.com/gmarik/Vundle.vim
  set nocompatible
  filetype off
  call vundle#begin("~/.vim/vundle")
  " let Vundle manage Vundle, required
  Plugin 'gmarik/Vundle.vim'
  Plugin 'belluzj/fantasque-sans'
  Plugin 'bling/minivimrc'
  Plugin 'vim-airline/vim-airline'
  Plugin 'vim-airline/vim-airline-themes'
  Plugin 'edkolev/promptline.vim'
  " Plugin 'einars/js-beautify'
  Plugin 'ctrlpvim/ctrlp.vim'
  Plugin 'powerline/fonts'
  Plugin 'scrooloose/nerdtree'
  " Plugin 'scrooloose/syntastic'
  Plugin 'tpope/vim-sensible'
  Plugin 'tpope/vim-fugitive'
  Plugin 'xolox/vim-misc'
  "Plugin 'Valloric/YouCompleteMe'
  " from jxie1
  "Plugin 'octol/vim-cpp-enhanced-highlight' " highlighting for c++11/14
  "Plugin 'Mizuchi/STL-Syntax' " improved c++11/14 STL highlighting
  "Plugin 'Yggdroot/indentLine' " display the indention levels with thin vertical line
  call vundle#end()
  endif

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

let g:ycm_global_ycm_extra_conf = '~/.ycm_extra_conf.py'
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1
set wildignore+=*\\tmp\\*,*.so,*.a,*.o
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/]\.(git|hg|svn|build)$',
  \ 'file': '\vtags|(\.(exe|so|dll|gch|a|out))$',
  \ 'link': '',
  \ }
"let g:ctrlp_user_command='find %s -type f'
