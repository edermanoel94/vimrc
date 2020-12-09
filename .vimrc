syntax on

filetype plugin indent on

set nocompatible
set relativenumber
set noerrorbells
set tabstop=4 softtabstop=4
set shiftwidth=4
set expandtab
set smartindent
set nu
set nowrap
set smartcase
set noswapfile
set nobackup
set undodir=~/.vim/undodir
set undofile
set incsearch

set encoding=UTF-8

set colorcolumn=120

highlight ColorColumn ctermbg=0 guibg=lightgrey

call plug#begin('~/.vim/plugged')

Plug 'takac/vim-hardtime'
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
Plug 'morhetz/gruvbox'
Plug 'jremmen/vim-ripgrep'
Plug 'tpope/vim-fugitive'
Plug 'vim-utils/vim-man'
Plug 'lyuts/vim-rtags'
Plug 'kien/ctrlp.vim'
Plug 'valloric/youcompleteme'
Plug 'mbbill/undotree'
Plug 'vim-airline/vim-airline'
Plug 'SirVer/ultisnips'
Plug 'ladislas/vim-snippets'
Plug 'ryanoasis/vim-devicons'

" initialize plugin system
call plug#end()

colorscheme gruvbox
set background=dark

if executable('rg')
    let g:rg_derive_root='true'
endif

let g:ctrlp_use_caching=0

let g:ctrlp_user_command = ['.git/', 'git --git-dir=%s/.git ls-files -oc --exclude-standard']

let mapleader=" "

let g:netrw_browse_split=2
let g:netrw_banner=0
let g:netrw_winsize=25

" UltiSnips

let g:UltiSnipsExpandTrigger="<c-j>"
let g:UltiSnipsJumpForwardTrigger="<c-j>"
let g:UltiSnipsJumpBackwardTrigger="<c-k>"
" Change path from your home
let g:UltiSnipsSnippetsDir='/home/eder/.vim/plugged/vim-snippets/UltiSnips'

nnoremap <leader>h :wincmd h<CR>
nnoremap <leader>j :wincmd j<CR>
nnoremap <leader>k :wincmd k<CR>
nnoremap <leader>l :wincmd l<CR>

nnoremap <leader>u :UndotreeToggle<CR>

nnoremap <leader>pv :Vexplore<CR>
nnoremap <leader>ps :Rg<SPACE>

" YouCompleteMe setup
nnoremap <silent> <leader>gt :YcmCompleter GoTo<CR>
nnoremap <silent> <leader>gd :YcmCompleter GoToDefinition<CR>
nnoremap <silent> <leader>gi :YcmCompleter GoToInclude<CR>
nnoremap <silent> <leader>fx :YcmCompleter FixIt<CR>
nnoremap <silent> <leader>gr :YcmCompleter GoToReferences<CR>

nnoremap <silent> <leader>- :vertical resize -10<CR>
nnoremap <silent> <leader>+ :vertical resize +10<CR>
