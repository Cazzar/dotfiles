" Disable vi emulation
set nocompatible

" Setup proper backup handling
set backup
set backupdir=~/.vim/backup
set directory=~/.vim/tmp

" Turn on syntax highlighting
syntax on
filetype plugin indent on

" Welcome to the real world
set encoding=utf8

" Tab handling. 2 tab width, soft-tabs
set tabstop=2
set softtabstop=2
set shiftwidth=2
set expandtab

" Setup status area
set ruler
set showcmd

" UI Stuff
set autoindent   " Use auto-indenting
set showmatch    " Show matching brackets
set vb t_vb=     " Silence screen flashes
set nohls        " Don't highlight searched items
set incsearch    " Incremental search
set backspace=indent,eol,start " Backspace through anything while in insert mode
set display=lastline " Show as much of a line as possible even if no room.
set cursorline   " Highlight current line
"set title        " Automatically set title
set scrolloff=5  " Attempt to keep 5 lines of context when scrolling
" set formatoptions=rq " Automatically insert comment leader on return
set whichwrap+=<,>,[,] " Wrap start to end when using cursor keys
set relativenumber " Use relative numbering.
set showtabline=2

set nowrap
set laststatus=2  " Always show status line.
set lazyredraw " Don't redraw screen when running macros.

" Highlight the status line
highlight StatusLine ctermfg=blue ctermbg=yellow

" Case insensitive by default, unless there are caps
set ignorecase
set smartcase

" Enable the mouse
"set mouse=a

" Line numbers
set number
set numberwidth=6

" Move up and down by single lines
noremap <Up> gk
noremap! <Up> <C-O>gk
noremap <Down> gj
noremap! <Down> <C-O>gj
" And move the old functionality to alt-arrow
noremap! <M-Up> <Up>
noremap! <M-Down> <Down>
noremap <M-Up> k
noremap <M-Down> j

filetype off " Required by Vundle.

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

"Plugin 'Valloric/YouCompleteMe' "Don't use this for now
Plugin 'ervandew/supertab'
Plugin 'tomtom/tcomment_vim'
Plugin 'vim-ruby/vim-ruby'
Plugin 'thoughtbot/vim-rspec'
Plugin 'tpope/vim-bundler'
Plugin 'mattn/emmet-vim' "EMMET!

" UI
Plugin 'nanotech/jellybeans.vim'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required


" VimRuby
autocmd FileType ruby compiler ruby

" Setup skins
set background=dark
"colorscheme elflord
colorscheme jellybeans


" Have I mentioned this is common for me?

command! Q q " Bind :Q to :q
command! Qall qall
command! QA qall
command! E e
command! W w
command! Wq wq

"nnoremap <C-Up> g
"nnoremap <C-Down> gt
nnoremap <C-Left> gT
nnoremap <C-Right> gt

set wildmenu
set wildmode=list:full

" By default, vim thinks .md is Modula-2.
autocmd BufNewFile,BufReadPost *.md set filetype=markdown

" Without this, vim breaks in the middle of words when wrapping
autocmd FileType markdown setlocal nolist wrap lbr

" Only do this part when compiled with support for autocommands.
if has("autocmd")

  " Enable file type detection.
  " Use the default filetype settings, so that mail gets 'tw' set to 72,
  " 'cindent' is on in C files, etc.
  " Also load indent files, to automatically do language-dependent indenting.
  filetype plugin indent on

  " Put these in an autocmd group, so that we can delete them easily.
  augroup vimrcEx
    au!

    " When editing a file, always jump to the last known cursor position.
    " Don't do it when the position is invalid or when inside an event handler
    " (happens when dropping a file on gvim).
    autocmd BufReadPost *
          \ if line("'\"") > 0 && line("'\"") <= line("$") |
          \   exe "normal g`\"" |
          \ endif

  augroup END

endif " has("autocmd")

