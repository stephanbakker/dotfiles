call plug#begin('$HOME/.config/nvim/plugged')

" Make sure you use single quotes

" copy from vimrc/mvim
Plug 'YankRing.vim'
Plug 'nanotech/jellybeans.vim'
Plug 'tpope/vim-surround'
Plug 'kien/ctrlp.vim'
Plug 'editorconfig/editorconfig-vim'
Plug 'mileszs/ack.vim'
" JS syntax, supports ES6
Plug 'othree/yajs.vim', { 'for': ['javascript'] }

" use neo-make iso syntastic
Plug 'benekastah/neomake'
Plug 'tpope/vim-fugitive'

" Shorthand notation; fetches https://github.com/junegunn/vim-easy-align
Plug 'junegunn/vim-easy-align'

" Group dependencies, vim-snippets depends on ultisnips
" Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'

" On-demand loading
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }

" Add plugins to &runtimepath
call plug#end()

set guioptions-=T

set scrolloff=3                 " number of lines around cursor, nice
set showmode
set showcmd
set hidden                      "hides buffers instead of closing, using :e
set wildmenu
set wildmode=longest,list
set wildignore+=.git
set visualbell                  "don't beep
set noerrorbells                "don't beep
set cursorline
set ruler
set list
"? not sure to remove and use defaults: set listchars=tab:▸\ ,eol:¬
set modelines=0
set nomodeline
set nojoinspaces        " Prevents inserting two spaces after punctuation on a join (J)
set autoread            " When a file has been changed outside read it again

" tab settings
set tabstop=4                   "a tab is four spaces
set shiftwidth=4                " number of spaces to use for autoindenting
set softtabstop=4
set expandtab
set shiftround                  " round indent to multiple of shiftwidth, using > or <
set smarttab                    " insert tabs on the start of a line according to shiftwidth, not tabstop
set copyindent                  "copy previous indentation on autoindting
set autoread                    " autoread when changed outside vim


" lines
"set textwidth=79 " forces linebreak while typing
set colorcolumn=85
set nowrap                      " don't wrap lines
set number                      "always show line numbers
set showmatch                   " set show matching parenthesis
set ignorecase
set smartcase                   " ignore case if search pattern is all lowercase
set title                       " show some info in title bar, file, edited?, path - VIM
set nobackup                    "don't make backup files
set noswapfile                  " no swapfiles, crach? too bad ;-)

" GUI
syntax on
set background=dark
color jellybeans
set guifont=Monaco:h12
set linespace=3


let mapleader=","

"clear highlighv
nmap <leader>/ :noh<CR>

" vertical split with vimrc file to edit 
nnoremap <leader>ev :tabe $HOME/.config/nvim/init.vim<cr>
" create new vertical split and move over to it
nnoremap <leader>sp <C-w>v<C-w>l

" source vimrc file
nnoremap <leader>sv :so $HOME/.config/nvim/init.vim<CR>

" strip all leading white space
nnoremap <leader>W :%s/\s\+$//<cr>:let @/=''<CR>

" reselect just pasted text, for reindenting etc
nnoremap <leader>v  V`]

" NERDTree config
" automatically open nerdtree on vim open
" autocmd vimenter * NERDTree
let NERDTreeIgnore=['\.pyc$', '\.rbc$', '\_$']
map <leader>n :NERDTreeToggle<CR>

" CtrlP 
let g:ctrlp_map = '<leader>t'
let g:ctrlp_cmd = 'CtrlP'
map <leader>t :CtrlP<CR>
let g:ctrlp_custom_ignore = '\v[\/](node_modules|target)$'

" move to left/right split more easily, to nerdtree on the left
"nnoremap <C-H> <C-W><C-H>
nnoremap <BS> <C-W><C-H>  " hack to using <BS> iso <C-H>
nnoremap <C-L> <C-W><C-L>

" folding
set foldmethod=syntax
set foldlevelstart=128
set foldcolumn=0

nnoremap <F1> za 
inoremap <F1> <C-O>za 
onoremap <F1> <C-C>za 

" let me use ; iso :
nnoremap ; :

" force save
map <leader>w :w!<CR>

" use tab to move to opening/closing
nnoremap <tab> %
vnoremap <tab> %

" NeoMake
autocmd! BufWritePost * Neomake
let g:neomake_javascript_jshint_maker = {
    \ 'args': ['--verbose'],
    \ 'errorformat': '%A%f: line %l\, col %v\, %m \(%t%*\d\)',
    \ }
let g:neomake_javascript_enabled_makers = ['jshint']
