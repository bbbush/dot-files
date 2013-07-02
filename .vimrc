if has('multi_byte')
  let legacy_encoding=&encoding
  set encoding=utf-8
  set fileencodings=ucs-bom,utf-8,chinese
endif

set nocompatible
set ai si ci
set nu is tw=78 sw=2 ts=8 et
set wildmenu
set list listchars=trail:',tab:»'

" Key mappings to make Home go to first non-blank column or first column
nnoremap <silent> <Home>      :call GoToFirstNonBlankOrFirstColumn()<CR>
inoremap <silent> <Home> <C-O>:call GoToFirstNonBlankOrFirstColumn()<CR>

augroup rst
autocmd Syntax rst map <F5> <Esc><Esc>:w<CR>:!rst2html % > %:r.html<CR>
augroup END

augroup spec
autocmd Filetype spec ia xdate <c-r>=GetDate()<cr> bbbush <bbbush.yuan@gmail.com> -
augroup END

func! GetDate()
  lang time en_US.UTF-8
  let strDate = strftime("%a %b %d %Y")
  lang time zh_CN.UTF-8
  return strDate
endfunc

" Function to switch the cursor position between the first column and the
" first non-blank column
func! GoToFirstNonBlankOrFirstColumn()
  let cur_col=col('.')
  normal! ^
  if cur_col != 1 && cur_col == col('.')
    normal! 0
  endif
endfunc

if $TERM == "screen" "set title
  set t_ts=k
  set t_fs=\
  "set titlestring=%t%(\ %M%)%(\ (%{expand(\"%:p:h\")})%)%(\ %a%)\ -\ %{v:servername}
endif

if $TERM == "screen" || $TERM == "xterm"
  set title
endif

  function! s:python_custom()
function! s:man(keyword)
  echo system('ipython -quick -c "help ' . a:keyword . '"')
  endfunction
  setlocal tabstop=4 expandtab shiftwidth=4
  setlocal foldnestmax=2 foldmethod=indent foldcolumn=3 foldlevel=2
command! -nargs=1 Man call s:man(<f-args>)
  cnoremap K viwy:Man <C-R>"<CR>
  endfunction
  if has("autocmd")
autocmd Filetype python call s:python_custom()
  endif

nmap <F10> <Esc> <Esc> :w <CR> :!make && ./a.out <CR>

