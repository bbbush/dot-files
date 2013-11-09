set nocompatible
set ai
filetype indent on
" set et  " expandtab when hit 'Tab' key, should set in individual files
set nu tw=78 sw=2 ts=4
set wildmenu
set list listchars=trail:',tab:»'

" Key mappings to make Home go to first non-blank column or first column
nnoremap <silent> <Home>      :call GoToFirstNonBlankOrFirstColumn()<CR>
inoremap <silent> <Home> <C-O>:call GoToFirstNonBlankOrFirstColumn()<CR>

augroup spec
autocmd Filetype spec ia xdate <c-r>=GetDate()<cr> Yijun Yuan <bbbush.yuan@gmail.com> -
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

nmap <F10> <Esc> <Esc> :w <CR> :!make && ./a.out <CR>

