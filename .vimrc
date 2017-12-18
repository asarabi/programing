set autoindent
set cindent
set smartindent
set tabstop=4
set shiftwidth=4
set colorcolumn=81
set autowrite
set mouse=a
"=== VIEW ===
set visualbell
set number
set ruler
set title
set wrap
set cursorline
set linebreak
set showmatch
set background=dark
set guifont=NanumGothicCoding:h12:cHANGEUL
"=== SEARCH ===
set nowrapscan
set hlsearch
set ignorecase
set incsearch

"=== EDIT ===
set backspace=eol,start,indent
set history=1000
set fencs=ucs-bom,utf-8,euc-kr,latin1
set fileencoding=utf-8
set nobackup

"=== Whitespace ===
autocmd BufWritePre * StripWhitespace


highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/

autocmd FileType c,cpp,java,php,javascript autocmd BufWritePre <buffer> :%s/\s\+$//e
autocmd BufReadPost *
    \ if line("'\"") > 1 && line("'\"") <= line("$") |
    \ exe "normal! g`\"" |
    \ endif

"<=== VUNDLE config Start ===>
set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
let path='~/.vim/bundle'
call vundle#begin(path)
Plugin 'gmarik/Vundle.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'L9'
Plugin 'git://git.wincent.com/command-t.git'
Plugin 'rstacruz/sparkup', {'rtp': 'vim'}
Plugin 'The-NERD-Tree'
Plugin 'Shougo/unite.vim'
Plugin 'bling/vim-airline'
Plugin 'flazz/vim-colorschemes'
Plugin 'tomasr/molokai'
Plugin 'Tagbar'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'altercation/vim-colors-solarized'
Plugin 'ntpeters/vim-better-whitespace'


nmap <c-h> <c-w>h
nmap <c-j> <c-w>j
nmap <c-k> <c-w>k
nmap <c-l> <c-w>l

nmap <F5> :NERDTreeToggle<CR>
nmap <F6> :Tagbar<CR>
nmap <F7> :cs find s <C-R>=expand("<cword>")<CR><CR>
nmap <F8> :cs find g <C-R>=expand("<cword>")<CR><CR>

call vundle#end()
filetype plugin indent on
"<=== VUNDLE config End ===>

"=== VIM-AIRLINE ===
set laststatus=2

"=== COLOR SCHEME ===
syntax on
syntax enable
"colorscheme candycode
"colorscheme molokai
"colorscheme solarized
colorscheme jellybeans

"ctags
set tags=./tags
"cscpoe
set csprg=/usr/bin/cscope
set csto=0
set cst
set nocsverb
if filereadable("./cscope.out")
    cs add cscope.out
endif
set csverb
