let mapleader=";"

set nocompatible
" Use system clipboard
set clipboard+=unnamedplus

" formatoptions stuff
" `:h fo-table` for all options
" set formatoptions-=o

call plug#begin('~/.local/share/nvim/plugged')
  Plug 'vim-airline/vim-airline'
  Plug 'vim-airline/vim-airline-themes'
  Plug 'dracula/vim', { 'as': 'dracula' }
  Plug 'luochen1990/rainbow'
  let g:rainbow_active = 0 " make color scheme good before enabling
  Plug 'scrooloose/nerdtree'

  Plug 'neoclide/coc.nvim', {'branch': 'release'}

  Plug 'sheerun/vim-polyglot'
  Plug 'fatih/vim-go'
  Plug 'harenome/vim-mipssyntax'
  Plug 'lervag/vimtex'
  let g:tex_flavor='latex'
  Plug 'KeitaNakamura/tex-conceal.vim', {'for': 'tex'}
  set conceallevel=2
  let g:tex_conceal='abdgm'
  let g:tex_conceal_frac=1

  Plug 'alvan/vim-closetag'
  Plug 'tpope/vim-surround'
  Plug 'tpope/vim-commentary'
  Plug 'machakann/vim-sandwich'

  Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
  Plug 'junegunn/fzf.vim'
call plug#end()

set mouse=a
syntax on
set ignorecase
set smartcase
set number relativenumber
set termguicolors
colorscheme dracula

" Makes transparent terminal better
hi Normal guibg=NONE ctermbg=NONE

" viminfo
set viminfo=%,<1000,'10,/50,:100,h,f0,n~/.vim/cache/.viminfo
"           | |     |   |   |    | |  + viminfo file path
"           | |     |   |   |    | + file marks 0-9,A-Z 0=NOT stored
"           | |     |   |   |    + disable 'hlsearch' loading viminfo
"           | |     |   |   + command-line history saved
"           | |     |   + search history saved
"           | |     + number of files for which marks saved
"           | + lines saved each register (old name for <, vi6.2)
"           + save/restore buffer list

" Tab settings
set expandtab shiftwidth=2 softtabstop=2 tabstop=2
set smartindent smarttab autoindent

" Tab-completion for files / commands
set wildmode=longest,list,full

" Defuault split directions
set splitbelow splitright

" How far the cursor is from the top / bottom when scrolling
" set to 999 to make cursor stay in the center
set scrolloff=7

let NERDTreeShowHidden=1

" Fold according to indentation
set foldmethod=indent
" Start with all folds open
set foldlevelstart=99

set noswapfile
set nobackup
set nowritebackup

" easier to see characters when `set list` is on
set listchars=tab:→\ ,eol:↲,nbsp:␣,space:·,trail:·,extends:⟩,precedes:⟨

" autocmd stuff

" Markdown
autocmd FileType markdown setlocal commentstring=<!--\ %s\ -->
autocmd FileType markdown setlocal spell spelllang=en_au

" Assembly
autocmd FileType asm setlocal commentstring=#\ %s
" For COMP1521 MIPS stuff
autocmd FileType asm setlocal syntax=mips
autocmd FileType asm setlocal expandtab shiftwidth=4 softtabstop=4 tabstop=4

" C
autocmd FileType c setlocal commentstring=//\ %s
" For COMP2521 & COMP1521 C stuffl
autocmd FileType c setlocal expandtab shiftwidth=4 softtabstop=4 tabstop=4

" All
" Remove trailing whitespace
autocmd BufWritePre * %s/\s\+$//e
" start at last place you were editing
autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
nnoremap <silent> <Tab> :bn<CR>
nnoremap <silent> <s-Tab> :bp<CR>
nnoremap <silent> <leader>q :bd<CR>
nnoremap <silent> <leader>b :NERDTreeToggle<CR>
nnoremap <silent> <leader>c :Commentary<CR>
vnoremap <silent> <leader>c :Commentary<CR>
nnoremap <silent> <leader>r :source ~/.config/nvim/init.vim<CR>
nnoremap <silent> <leader>n :noh<CR>
nnoremap <C-p> :Files<CR>

" Function keys
set pastetoggle=<F3>
map <F4> :set list!<CR>
map <F5> :set relativenumber!<CR>

source ~/.config/nvim/coc.vim

