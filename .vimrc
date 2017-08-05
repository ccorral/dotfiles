set nocompatible              " be iMproved, required
filetype off                  " required
set modelines=0               " security stuff

set autochdir
let NERDTreeChDirMode=2
let NERDTreeShowHidden=1
nnoremap <leader>n :NERDTree Desktop<CR>

set tabstop=8 softtabstop=0 expandtab shiftwidth=4 smarttab
" set tabstop=4
" set shiftwidth=4
" set softtabstop=4
" set expandtab
set number

" Specify a directory for plugins (for Neovim: ~/.local/share/nvim/plugged)
call plug#begin('~/.vim/plugged')

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'ryanoasis/vim-devicons'
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug '~/.vim/plugged/sexy_scroller'

" Initialize plugin system
call plug#end()

autocmd vimenter * NERDTree
let g:NERDTreeWinSize = 40
map <F2> :NERDTreeToggle<CR>

let g:airline_theme='dark'
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1

set encoding=utf8
set guifont=Droid\ Sans\ Mono\ for\ Powerline\ Plus\ Nerd\ File\ Types:h11

let g:jsx_ext_required = 0

" Smooth Scrolling {{{
let g:SexyScroller_ScrollTime = 200
let g:SexyScroller_CursorTime = 5
let g:SexyScroller_MaxTime = 1000
let g:SexyScroller_EasingStyle = 3
" }}}

" --column: Show column number
" --line-number: Show line number
" --no-heading: Do not show file headings in results
" --fixed-strings: Search term as a literal string
" --ignore-case: Case insensitive search
" --no-ignore: Do not respect .gitignore, etc...
" --hidden: Search hidden files and folders
" --follow: Follow symlinks
" --glob: Additional conditions for search (in this case ignore everything in the .git/ folder)
" --color: Search color options
command! -bang -nargs=* Find call fzf#vim#grep('rg --column --line-number --no-heading --fixed-strings --ignore-case --no-ignore --hidden --follow --glob "!.git/*" --color "always" '.shellescape(<q-args>), 1, <bang>0)
