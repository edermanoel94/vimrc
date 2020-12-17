syntax on

filetype plugin indent on

set autoread
set noshowmode
set cursorline
set cursorcolumn
set nocompatible
set noerrorbells
set tabstop=4 softtabstop=4
set shiftwidth=4
set expandtab
set smartindent
set nu relativenumber
set nowrap
set smartcase
set noswapfile
set nobackup
set undodir=~/.vim/undodir
set undofile
set incsearch
set encoding=utf-8
set laststatus=2
set colorcolumn=120

highlight ColorColumn ctermbg=0 guibg=lightgrey

call plug#begin('~/.vim/plugged')

Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
Plug 'morhetz/gruvbox'
Plug 'jremmen/vim-ripgrep'
Plug 'tpope/vim-fugitive'
Plug 'vim-utils/vim-man'
Plug 'kien/ctrlp.vim'
Plug 'valloric/youcompleteme'
Plug 'mbbill/undotree'
Plug 'vim-airline/vim-airline'
Plug 'SirVer/ultisnips'
Plug 'ladislas/vim-snippets'
Plug 'kien/rainbow_parentheses.vim'
Plug 'rust-lang/rust.vim'

" initialize plugin system
call plug#end()

colorscheme gruvbox
set background=dark

let g:airline_theme = 'dark'

let mapleader=" "

" RIP Grep

if executable('rg')
    let g:rg_derive_root='true'
endif

nnoremap <leader>rg :Rg<SPACE>

" CTRL+P

let g:ctrlp_use_caching=0
let g:ctrlp_user_command = ['.git/', 'git --git-dir=%s/.git ls-files -oc --exclude-standard']


 " Netrw

let g:netrw_browse_split=4
let g:netrw_winsize=25
let g:netrw_banner=0

nnoremap <leader>pv :Vexplore<CR>

" UltiSnips

let g:UltiSnipsExpandTrigger="<c-j>"
let g:UltiSnipsJumpForwardTrigger="<c-j>"
let g:UltiSnipsJumpBackwardTrigger="<c-k>"
let g:UltiSnipsMappingsToIgnore = ['autocomplete']

let g:UltiSnipsSnippetsDir= $HOME . '/.vim/plugged/vim-snippets/UltiSnips'

" Miscs

" replace all with case sensitive
nnoremap <leader>s :%s///gI<Left><Left><Left><Left>

nnoremap <leader>q :q<CR>
nnoremap <leader>w :w<CR>

" Window management

nnoremap <leader>h :wincmd h<CR>
nnoremap <leader>j :wincmd j<CR>
nnoremap <leader>k :wincmd k<CR>
nnoremap <leader>l :wincmd l<CR>

nnoremap <silent> <leader>- :vertical resize -10<CR>
nnoremap <silent> <leader>+ :vertical resize +10<CR>

" Undo Tree

nnoremap <leader>u :UndotreeToggle<CR>

" YouCompleteMe setup

" on save current buffer, force Ycm diagnostics
autocmd BufWritePost * YcmForceCompileAndDiagnostics

nnoremap <silent> <leader>gt :YcmCompleter GoTo<CR>
nnoremap <silent> <leader>gi :YcmCompleter GoToImplementation<CR>
nnoremap <silent> <leader>gr :YcmCompleter GoToReferences<CR>
nnoremap <silent> <leader>fm :YcmCompleter Format<CR>
nnoremap <silent> <leader>fx :YcmCompleter FixIt<CR>
nnoremap <silent> <leader>gd :YcmCompleter GetDoc<CR>
nnoremap <silent> <leader>ty :YcmCompleter GetType<CR>
nnoremap <leader>pf :YcmCompleter RefactorRename<SPACE>

let g:ycm_complete_in_comments = 1
let g:ycm_collect_identifiers_from_comments_and_strings = 1
let g:ycm_seed_identifiers_with_syntax = 1
let g:ycm_always_populate_location_list = 1

" Git

nnoremap <silent> <leader>gs :G<CR>
nnoremap <silent> <leader>gc :Gcommit<CR>
nnoremap <silent> <leader>gp :Gpush<CR>

" Rainbow

au VimEnter * RainbowParenthesesToggle
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBraces

" Rust

let g:rustfmt_autosave=1

" GO

let g:go_highlight_operators = 1
let g:go_highlight_function_calls = 1
let g:go_highlight_functions = 1
let g:go_highlight_fields = 1
let g:go_highlight_types = 1
let g:go_fmt_command = "goimports"

" JSON format

nnoremap <leader>jq :%!jq .<CR>
nnoremap <leader>ji :%!jq -rc .<CR>
