let mapleader=";"

set nocompatible
" Use system clipboard
set clipboard+=unnamedplus

" formatoptions stuff
" `:h fo-table` for all options
" set formatoptions-=o

" Install vim-plug if not already installed
if empty(glob('~/.local/share/nvim/plugged'))
  silent !sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}/nvim/site/autoload/plug.vim" --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall
endif

if filereadable(expand("~/.local/share/nvim/site/autoload/plug.vim"))
  call plug#begin('~/.local/share/nvim/plugged')
    Plug 'vim-airline/vim-airline'
    Plug 'vim-airline/vim-airline-themes'
    Plug 'dracula/vim', { 'as': 'dracula' }

    Plug 'scrooloose/nerdtree'

    Plug 'neoclide/coc.nvim', {'branch': 'release'}

    Plug 'sheerun/vim-polyglot'
    Plug 'fatih/vim-go'

    Plug 'alvan/vim-closetag'
    Plug 'tpope/vim-surround'
    Plug 'tpope/vim-commentary'

    Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
    Plug 'junegunn/fzf.vim'

    " Unused
    " Plug 'lervag/vimtex'
    " let g:tex_flavor='latex'
    " Plug 'KeitaNakamura/tex-conceal.vim', {'for': 'tex'}
    " let g:tex_conceal='abdgm'
    " let g:tex_conceal_frac=1
    " Plug 'luochen1990/rainbow'
    " let g:rainbow_active = 0 " make color scheme good before enabling

  call plug#end()
endif

set mouse=a
syntax on
set ignorecase
set smartcase
set number relativenumber
set termguicolors
colorscheme dracula

set conceallevel=1

" let g:airline#extensions#tabline#enabled = 1

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
let NERDTreeIgnore = ['^node_modules$', '^__pycache__$', '^\.git$']

" Fold according to indentation
set foldmethod=indent
" Start with all folds open
set foldlevelstart=99

set noswapfile
set nobackup
set nowritebackup

" easier to see characters when `set list` is on
set listchars=tab:→\ ,eol:↲,nbsp:␣,space:·,trail:·,extends:⟩,precedes:⟨

" FZF
let g:fzf_layout = { 'window': { 'width': 0.8, 'height': 0.6 } }
let $FZF_DEFAULT_OPTS='--reverse'

" autocmd stuff

" Markdown
autocmd FileType markdown setlocal commentstring=<!--\ %s\ -->
autocmd FileType markdown setlocal spell spelllang=en_au

" Assembly
autocmd FileType asm setlocal commentstring=#\ %s

" C
autocmd FileType c setlocal commentstring=//\ %s

" SQL
autocmd FileType sql setlocal commentstring=\-\-\ %s

" All
" Remove trailing whitespace

fun! StripTrailingWhitespace()
  if &ft =~ 'markdown'
    return
  endif

  %s/\s\+$//e
endfun

autocmd BufWritePre * call StripTrailingWhitespace()

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
nnoremap <C-p> :GFiles<CR>
nnoremap <M-p> :Files<CR>

" Function keys
set pastetoggle=<F3>
map <F4> :set list!<CR>
map <F5> :set relativenumber!<CR>

source ~/.config/nvim/coc.vim

