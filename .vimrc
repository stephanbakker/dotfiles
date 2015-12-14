set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
Plugin 'YankRing.vim'
Plugin 'nanotech/jellybeans.vim'
Plugin 'tpope/vim-surround'
Plugin 'pangloss/vim-javascript'
"Plugin 'Valloric/YouCompleteMe'
Plugin 'marijnh/tern_for_vim'
Plugin 'kien/ctrlp.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/syntastic'
Plugin 'mattn/emmet-vim'
Bundle "MarcWeber/vim-addon-mw-utils"
Bundle "tomtom/tlib_vim"
Plugin 'garbas/vim-snipmate'
Plugin 'honza/vim-snippets'
Plugin 'matchit.zip'
Plugin 'editorconfig/editorconfig-vim'
Plugin 'mileszs/ack.vim'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

filetype plugin on
filetype plugin indent on

color jellybeans

set guioptions-=T
set encoding=utf-8
set modelines=0
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
set backspace=indent,eol,start
set laststatus=2
set list
set listchars=tab:▸\ ,eol:¬
set modelines=0
set nomodeline


" tab settings
set tabstop=4                   "a tab is four spaces
set shiftwidth=4                " number of spaces to use for autoindenting
set softtabstop=4
set expandtab
set shiftround                  " round indent to multiple of shiftwidth, using > or <
set smarttab                    " insert tabs on the start of a line according to shiftwidth, not tabstop
set copyindent                  "copy previous indentation on autoindting
set autoindent

" lines
"set textwidth=79 " forces linebreak while typing
set colorcolumn=85
set nowrap                      " don't wrap lines
set number                      "always show line numbers
set showmatch                   " set show matching parenthesis
set ignorecase
set smartcase                   " ignore case if search pattern is all lowercase
set title                       " show some info in title bar, file, edited?, path - VIM
set hlsearch                    "highlight search terms
set incsearch                   " show search matches as you type
set nobackup                    "don't make backup files
set noswapfile                  " no swapfiles, crach? too bad ;-)

" GUI
syntax on
set background=dark
set guifont=Monaco:h12
set linespace=3

"au FocusLost * :wa      "autosave on losing focus, persistant undo next
" -------------------- remapping keys
let mapleader=","

"clear highlighv
nmap <leader>/ :noh<CR>

" vertical split with vimrc file to edit 
nnoremap <leader>ev <C-w><C-v><C-w>l :e $MYVIMRC<cr>
" create new vertical split and move over to it
nnoremap <leader>sp <C-w>v<C-w>l

" source vimrc file
nnoremap <leader>sv :so $MYVIMRC<CR>

" strip all leading white space
nnoremap <leader>W :%s/\s\+$//<cr>:let @/=''<CR>

" reselect just pasted text, for reindenting etc
nnoremap <leader>v  V`]

" cd to current file directory, and show new dir
map <leader>cd :cd %:p:h<CR>:pwd<CR>

" NERDTree config
" automatically open nerdtree on vim open
" autocmd vimenter * NERDTree
let NERDTreeIgnore=['\.pyc$', '\.rbc$', '\_$']
map <leader>n :NERDTreeToggle<CR>


"CtrlP 
let g:ctrlp_map = '<leader>t'
let g:ctrlp_cmd = 'CtrlP'
map <leader>t :CtrlP<CR>
let g:ctrlp_custom_ignore = '\v[\/](node_modules|target)$'
" move to left/right split more easily, to nerdtree on the left
nnoremap <C-H> <C-W><C-H>
nnoremap <C-L> <C-W><C-L>

"au FileType javascript map <leader>f zfi{


" force myself to use hjkl
map <up> <nop>
map <down> <nop>
map <left> <nop>
map <right> <nop>
nnoremap ; :
nnoremap <tab> %
vnoremap <tab> %

"folding
set foldlevelstart=99

" -------- html
" folding in html
au FileType html map <leader>f zfit

"fold tag
nnoremap <F1> za 
inoremap <F1> <C-O>za 
onoremap <F1> <C-C>za 
"vnoremap <F1> zf 

" navigate tabs
map  <D-0> 0gt
imap <D-0> <Esc>0gt
map  <D-1> 1gt
imap <D-1> <Esc>1gt
map  <D-2> 2gt
imap <D-2> <Esc>2gt
map  <D-3> 3gt
imap <D-3> <Esc>3gt
map  <D-4> 4gt
imap <D-4> <Esc>4gt
map  <D-5> 5gt
imap <D-5> <Esc>5gt
map  <D-6> 6gt
imap <D-6> <Esc>6gt
map  <D-7> 7gt
imap <D-7> <Esc>7gt
map  <D-8> 8gt
imap <D-8> <Esc>8gt
map  <D-9> 9gt
imap <D-9> <Esc>9gt


" set json files to filetype javascript
autocmd BufNewFile,BufRead *.json set ft=javascript

" javascript
" explanation in https://github.com/JiangMiao/simple-javascript-indenter
let g:SimpleJsIndenter_BriefMode = 1

" syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_javascript_checkers = ['jshint']
" disable autocheck on html, due to angular custom tags/attrs etc
let syntastic_mode_map = { 'passive_filetypes': ['html'] }

function! JavaScriptFold()
    set foldmethod=marker
    set foldmarker={,}
    set foldtext=getline(v:foldstart)
endfunction
au FileType javascript call JavaScriptFold()

" for text files
function! MyTextFiles()
    set tw=100
endfunction
au FileType text call MyTextFiles

" jsLint http://technotales.wordpress.com/2011/05/21/node-jslint-and-vim/
" using syntastic now
" nmap <F4> :w<CR>:make<CR>:cw<CR>

" force save
map <leader>w :w!<CR>

"MacVim specials
if has('gui_running')
    
    set undolevels=200
    set undofile            "save file history, even on closing and reopening the file
    set undodir=~/.vim/.undo

endif


