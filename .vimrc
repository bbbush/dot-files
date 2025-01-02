" setup Vundle
set nocompatible              " be iMproved, required

" Put your non-Plugin stuff after this line
filetype indent on
set list listchars=trail:',tab:»'
let g:airline_powerline_fonts = 1
set et ts=4
set wildmenu

if has("gui_running")
  set guifont=DejaVu\ Sans\ Mono\ for\ Powerline\ 13
  set lines=40 columns=120
  colorscheme darkblue
  " copy and paste
  vnoremap <C-c> "+yi
  vnoremap <C-x> "+c
  vnoremap <C-v> c<ESC>"+p
  inoremap <C-v> <ESC>"+pa
  nnoremap <C-z> <nop>
  inoremap <C-z> <C-o>:u<CR>
endif

" Key mappings to make Home go to first non-blank column or first column
nnoremap <silent> <Home>      :call GoToFirstNonBlankOrFirstColumn()<CR>
inoremap <silent> <Home> <C-O>:call GoToFirstNonBlankOrFirstColumn()<CR>

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
