set nocompatible

syntax on

filetype on
filetype plugin on
filetype indent on

set autoread
set hidden
set noerrorbells
set tabstop=4 softtabstop=4
set shiftwidth=4
set expandtab
set smartindent
set nu relativenumber
set nowrap
set smartcase
set noswapfile
set incsearch
set hlsearch
set encoding=utf-8
set colorcolumn=120
set updatetime=300

let mapleader=" "

highlight ColorColumn ctermbg=0 guibg=lightgrey

call plug#begin('~/.vim/plugged')

Plug 'morhetz/gruvbox'
Plug 'airblade/vim-gitgutter'
Plug 'vim-utils/vim-man'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'voldikss/vim-floaterm'
Plug 'vim-airline/vim-airline'
Plug 'kien/rainbow_parentheses.vim'

" initialize plugin system
call plug#end()


set termguicolors

" Gruvbox

colorscheme gruvbox
set background=dark

" Float Term

let g:floaterm_keymap_toggle = '<leader>t'
let g:floaterm_autoclose = 1
let g:floaterm_width=0.8
let g:floaterm_height=0.8

command! PY  FloatermNew --height=0.8 --width=0.8 --name=Python python3

if executable('ytop')
    command! TOP FloatermNew --height=0.8 --width=0.8 --autoclose=2 --name=YTOP ytop
else
    command! TOP FloatermNew --height=0.8 --width=0.8 ---autoclose=2 --name=HTOP htop
endif

if executable('lazygit')
    command! LG FloatermNew --height=0.8 --width=0.8 --name=Lazygit lazygit
    nnoremap <leader>lg :LG<CR>
endif

if executable('node')
    command! NODE  FloatermNew --height=0.8 --width=0.8 --name=Node node
endif

" Netrw

nnoremap <leader>pv :Vexplore<CR>

let g:netrw_browse_split=4
let g:netrw_winsize=25
let g:netrw_banner=0
let g:netrw_liststyle = 3
let g:netrw_browse_split = 4
let g:netrw_altv = 1

" FZF

nnoremap <C-p> :Files<CR>
nnoremap <C-b> :Buffers<CR>
nnoremap <expr> <C-g> (len(system('git rev-parse')) ? ':Files' : ':GFiles --exclude-standard --others --cached')."\<cr>"

" RG

command! -bang -nargs=* Rg call fzf#vim#grep("rg --column --line-number --no-heading --color=always --smart-case ".(<q-args>), 1, {'options': '--delimiter : --nth 4..'}, <bang>0)

nnoremap <C-f> :Rg

" Search for specified method in C++ Header
" nnoremap <leader>mr :Rg --glob '*.hpp' --word-regexp 'type\s\w+\([\w,\s]*\);$'<Left><Left><Left><Left><Left><Left><Left><Left><Left><Left><Left><Left><Left><Left><Left><Left>

" Miscs

" In case of <C-6> dons't work
nnoremap <leader>b :e #<CR>

" replace all with case sensitive

nnoremap <leader>s :%s/<C-r><C-w>//gI<Left><Left><Left>

nnoremap <leader>q :q<CR>
nnoremap <leader>w :w<CR>

" CTags

command! MakeTags !ctags -R .

nnoremap <leader>gd :execute "tag " . expand("<cword>")<CR>
nnoremap <leader>gr :execute "tjump " . expand("<cword>")<CR>

" Window management

nnoremap <silent> <leader>- :vertical resize -10<CR>
nnoremap <silent> <leader>+ :vertical resize +10<CR>

" Rainbow

au VimEnter * RainbowParenthesesToggle
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBraces

" JSON format

if executable('jq')
    nnoremap <leader>jq :%!jq .<CR>
    nnoremap <leader>ji :%!jq -rc .<CR>
endif
