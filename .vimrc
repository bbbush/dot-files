" first setup pathogen and Vundle
set nocompatible              " be iMproved, required
filetype off                  " required
" let pathogen take care of bundle folder
runtime bundle/vim-pathogen/autoload/pathogen.vim
execute pathogen#infect()
filetype off                  " again
call vundle#begin('~/.vim/vundle')
Plugin 'gmarik/Vundle.vim'    " let Vundle manage Vundle, required
Plugin 'bling/vim-airline'
set laststatus =2
let g:airline#extensions#tabline#enabled = 1

Plugin 'edkolev/promptline.vim'
Plugin 'ervandew/eclim'
Plugin 'kien/ctrlp.vim'
set wildignore+=*/tmp/*,*.so,*.swp,*.zip     " MacOSX/Linux
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/]\.(git|hg|svn)$',
  \ 'file': '\v\.(exe|so|dll)$',
  \ 'link': 'some_bad_symbolic_links',
  \ }

Plugin 'majutsushi/tagbar'
Plugin 'myint/syntastic-extras'
Plugin 'OmniSharp/omnisharp-vim'
Plugin 'powerline/fonts'
let g:airline_powerline_fonts = 1

Plugin 'rust-lang/rust.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/syntastic'
"Plugin 'sickill/vim-monokai'
Plugin 'tomasr/molokai'
Plugin 'tpope/vim-fugitive'
Plugin 'Valloric/YouCompleteMe'
let g:ycm_global_ycm_extra_conf = '~/.ycm_extra_conf.py'

Plugin 'venantius/vim-eastwood'
Plugin 'xolox/vim-misc'
Plugin 'xolox/vim-easytags'
Plugin 'xolox/vim-shell'

" All of your Plugins must be added before the following line
call vundle#end()             " required
filetype plugin indent on     " required
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

set ai
" set et  " expandtab when hit 'Tab' key, should set in individual files
set nu tw=78 sw=2 ts=4
set wildmenu
set list listchars=trail:',tab:»'

if has('gui_running')
  colorscheme molokai
  set guifont=Liberation\ Mono\ for\ Powerline
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

