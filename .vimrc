set autoindent
set smartindent
set number
set mouse=a
set encoding=utf-8
set fileencodings=utf-8,default,korea
set tabstop=4
set expandtab
set shiftwidth=4
set ruler
set loadplugins
set smartcase
set showcmd
set showmatch
set title
set wildmenu
set sel=exclusive
set background=dark
set hlsearch
set colorcolumn=80
set tags=./tags,tags;
set fileformat=unix
set splitright

highlight ws ctermbg=red guibg=red
match ws /\s\+$/
autocmd BufWinEnter * match ws / \+$/


autocmd BufWritePre * :%s/\s\+$//ge

"vim vundle setting

set nocompatible
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
Plugin 'tpope/vim-fugitive'
" plugin from http://vim-scripts.org/vim/scripts.html
Plugin 'L9'
" Git plugin not hosted on GitHub
"Plugin 'git://git.wincent.com/command-t.git'
" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" Install L9 and avoid a Naming conflict if you've already installed a
" different version somewhere else.
"Plugin 'ascenator/L9', {'name': 'newL9'}

" my plugin
Plugin 'Command-T'
Plugin 'FuzzyFinder'
Plugin 'matchparenpp'
Plugin 'ctags.vim'
Plugin 'sudo.vim'
Plugin 'https://github.com/Lokaltog/vim-powerline.git'
Plugin 'Tagbar'
Plugin 'The-NERD-tree'
Plugin 'SuperTab'
Plugin 'Clever-Tabs'
Plugin 'ntpeters/vim-better-whitespace'
Plugin 'AutoComplPop'
Plugin 'taglist-plus'
Plugin 'moll/vim-node'
Plugin 'jelera/vim-javascript-syntax'
Plugin 'othree/javascript-libraries-syntax.vim'
Plugin 'https://github.com/Shutnik/jshint2.vim'

" All oa your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList          - list configured plugins
" :PluginInstall(!)    - install (update) plugins
" :PluginSearch(!) foo - search (or refresh cache first) for foo
" :PluginClean(!)      - confirm (or auto-approve) removal of unused plugins
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line
"

nmap <F2> :tprevious<CR>
nmap <F3> :tnext<CR>
nmap <F4> :TlistToggle<CR>
nmap <F5> :NERDTreeToggle <CR>
nmap <F6> :TagbarToggle <CR>
nmap <F7> :cs find s <C-R>=expand("<cword>")<CR><CR>
nmap <F8> :cs find g <C-R>=expand("<cword>")<CR><CR>

nmap <C-H> <C-W>h
nmap <C-J> <C-W>j
nmap <C-K> <C-W>k
nmap <C-L> <C-W>l

"jshint2
set runtimepath+=~/.vim/bundle/jshint2.vim/
let g:syntastic_javascript_checkers = ['jshint']
let g:syntastic_check_on_open = 1
autocmd BufWritePost *.js JSHint


"let Cscope_OpenQuickfixWindow=1
let Cscope_JumpError=0
let Cscope_PopupMenu=1
let Cscope_ToolsMenu=1

set nocsverb


if filereadable("./cscope.out")
   cs add cscope.out
endif

let g:tagbar_right = 1
let g:tagbar_width = 30
let g:tagbar_sort = 0

let g:NERDTreeWinSize = 30
let g:NERDTreeWinPos = "left"
let g:NERDTreeAutoCenter = 0
let g:NERDTreeIgnore = ['\.o$', '\~$', '\.dtb$', '\.pyc$']

set t_Co=256
language en_US.UTF-8
set laststatus=2
let g:Powerline_symbols = 'unicode'

" change the mapleader from \ to ,
let mapleader=","

" omnicompletion : words
inoremap <leader>, <C-x><C-o>

" omnicompletion : filenames
inoremap <leader>: <C-x><C-f>

" omnicompletion : lines
inoremap <leader>= <C-x><C-l>

" CommandT config
noremap <leader>o <Esc>:CommandT<CR>
noremap <leader>O <Esc>:CommandTFlush<CR>
noremap <leader>m <Esc>:CommandTBuffer<CR>

" Supertab
let g:SuperTabDefaultCompletionType = "<C-n>"

set omnifunc=syntaxcomplete#Complete

let g:neocomplcache_enable_at_startup = 1
let g:neocomplcache_enable_smart_case = 1
let g:neocomplcache_min_syntax_length = 3

"let g:miniBufExplMaxSize = 1
set fdm=marker

syntax on
set nocindent
set hls
set visualbell

" Restore cursor position to where it was before
augroup JumpCursorOnEdit
   au!
   autocmd BufReadPost *
            \ if expand("<afile>:p:h") !=? $TEMP |
            \   if line("'\"") > 1 && line("'\"") <= line("$") |
            \     let JumpCursorOnEdit_foo = line("'\"") |
            \     let b:doopenfold = 1 |
            \     if (foldlevel(JumpCursorOnEdit_foo) > foldlevel(JumpCursorOnEdit_foo - 1)) |
            \        let JumpCursorOnEdit_foo = JumpCursorOnEdit_foo - 1 |
            \        let b:doopenfold = 2 |
            \     endif |
            \     exe JumpCursorOnEdit_foo |
            \   endif |
            \ endif
   " Need to postpone using "zv" until after reading the modelines.
   autocmd BufWinEnter *
            \ if exists("b:doopenfold") |
            \   exe "normal zv" |
            \   if(b:doopenfold > 1) |
            \       exe  "+".1 |
            \   endif |
            \   unlet b:doopenfold |
            \ endif
augroup END

colorscheme desert

hi Search cterm=NONE ctermfg=white ctermbg=gray

nmap <C-\>s :cs find s <C-R>=expand("<cword>")<CR><CR>
nmap <C-\>g :cs find g <C-R>=expand("<cword>")<CR><CR>
nmap <C-\>c :cs find c <C-R>=expand("<cword>")<CR><CR>
nmap <C-\>t :cs find t <C-R>=expand("<cword>")<CR><CR>
nmap <C-\>e :cs find e <C-R>=expand("<cword>")<CR><CR>
nmap <C-\>f :cs find f <C-R>=expand("<cfile>")<CR><CR>
nmap <C-\>i :cs find i <C-R>=expand("<cfile>")<CR><CR>
nmap <C-\>d :cs find d <C-R>=expand("<cword>")<CR><CR>


let $GIT_SSL_NO_VERIFY = 'true'

"vim-node
autocmd User Node
  \ if &filetype == "javascript" |
  \   nmap <buffer> <C-w>f <Plug>NodeVSplitGotoFile |
  \   nmap <buffer> <C-w><C-f> <Plug>NodeVSplitGotoFile |
  \ endif


