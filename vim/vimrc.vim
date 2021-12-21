" basic settings
syntax enable
set backspace=indent,eol,start
set ls=2
set noshowmode
set number
set hidden
set foldmethod=indent
set foldlevel=99

" default text formatting
set tabstop=4
set softtabstop=4
set shiftwidth=4
set textwidth=80
set expandtab
set autoindent
set fileformat=unix
set encoding=utf-8

" text format overrides for 2-space tab stop file formats
au BufNewFile,BufRead *.css,*.ex,*.exs,*.html,*.js,*.json,*.jsx,*.rb,*.ts,*.tsx
\     set tabstop=2 |
\     set softtabstop=2 |
\     set shiftwidth=2

" special syntax highlighing
autocmd FileType json syntax match Comment +\/\/.\+$+

" remaps
imap jk <Esc>
map <Space> <leader>

" moves
nnoremap <C-j> :m .+1<CR>==
nnoremap <C-k> :m .-2<CR>==
nnoremap <C-l> >>_
nnoremap <C-h> <<_
vnoremap <C-j> :m '>+1<CR>gv=gv
vnoremap <C-k> :m '<-2<CR>gv=gv
vnoremap <C-l> >gv
vnoremap <C-h> <gv

" splits
set splitbelow
set splitright
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

call plug#begin()

" editor features
Plug 'jiangmiao/auto-pairs'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'jason0x43/vim-js-indent'
Plug 'Quramy/vim-js-pretty-template'
Plug 'scrooloose/nerdtree'
Plug 'jeffkreeftmeijer/vim-numbertoggle'
Plug 'sheerun/vim-polyglot'
Plug 'tpope/vim-surround'

" status line
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" color schemes
Plug 'dracula/vim'
Plug 'morhetz/gruvbox'
Plug 'mhartington/oceanic-next'

call plug#end()

" shortcuts
nmap <leader>ne :NERDTreeToggle<CR>
nmap <leader>w :w<CR>
nmap <leader>tn :tabnew<CR>
nmap <leader>td :tabclose<CR>
nmap <leader>tp :tabp<CR>
nmap <leader>tn :tabn<CR>
nmap <leader>bp :bp<CR>
nmap <leader>bn :bn<CR>
nmap <leader>bd :bd<CR>

" sign column
set signcolumn=yes
highlight clear SignColumn

" enable more colors
if exists('+termguicolors')
    let &t_8f="\<Esc>[38;2;%lu;%lu;%lum"
    let &t_8b="\<Esc>[48;2;%lu;%lu;%lum"
    set termguicolors
    set background=dark
endif

" apply local settings
source ~/.vim/local.vim

" allow project-specific overrides
set exrc
set secure
