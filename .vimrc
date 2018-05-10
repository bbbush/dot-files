" setup Vundle
set nocompatible              " be iMproved, required
filetype off                  " required
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin('~/.vim/vundle')
Plugin 'VundleVim/Vundle.vim' " let Vundle manage Vundle, required
Plugin 'vim-airline/vim-airline'
call vundle#end()            " required
filetype plugin indent on    " required

" Put your non-Plugin stuff after this line
set list listchars=trail:',tab:»'
let g:airline_powerline_fonts = 1
set et ts=4
set wildmenu

if has("gui_running")
  set guifont=DejaVu\ Sans\ Mono\ for\ Powerline\ 13
  set lines=40 columns=120
  colorscheme darkblue
  " copy and paste
  vmap <C-c> "+yi
  vmap <C-x> "+c
  vmap <C-v> c<ESC>"+p
  imap <C-v> <ESC>"+pa
endif

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

" vim: set ai et sw=2:
