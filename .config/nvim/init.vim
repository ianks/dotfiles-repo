" TODO: this may not be in the correct place. It is intended to allow overriding <Leader>.
" source ~/.vimrc.before if it exists.
if filereadable(expand("~/.vimrc.before"))
  source ~/.vimrc.before
endif

set shell=/bin/sh

set noswapfile

if has('nvim')
  autocmd TermOpen term://* startinsert
endif

if exists('g:gui_oni')
  set nocompatible              " be iMproved, required
  filetype off                  " required

  set number
  set smartcase

  " Enable GUI mouse behavior
  set mouse=a

  " If using Oni's externalized statusline, hide vim's native statusline,
  set noshowmode
  set noruler
  set laststatus=0
  set noshowcmd
else
  set gcr=a:blinkon0              " Disable cursor blink
  set showmode                    " Show current mode down the bottom
endif

" ================ General Config ====================

set number                      " Line numbers are good
set visualbell                  " No sounds
set autoread                    " Refresh files automatically
set confirm
set mouse=a


" This makes vim act like all other editors, buffers can
" exist in the background without being in a window.
" http://items.sjbach.com/319/configuring-vim-right
set hidden

" Turn on syntax highlighting
syntax on

" Space is your leader
let mapleader = "\<Space>"

if has('nvim')
  set inccommand=nosplit
endif

" =============== plugs Initialization ===============
" This loads all the plugins specified in ~/.config/nvim/plugs.vim
" Use plugs plugin to manage all other plugins

lua << EOF
if require "ianks.first_load"() then
  return
end
EOF

lua require("ianks.plugins")
" if !filereadable(expand("~/.config/nvim/autoload/plug.vim"))
"   silent !mkdir -p ~/.config/nvim/autoload
"   silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
" endif

" if filereadable(expand("~/.config/nvim/plugs.vim"))
"   source ~/.config/nvim/plugs.vim
" endif

" ================ Turn Off Swap Files ==============

set noswapfile
set nobackup
set nowb

" ================ Persistent Undo ==================
" Keep undo history across sessions, by storing in file.
" Only works all the time.
if has('persistent_undo')
  if !isdirectory($HOME.'/.config/nvim/backups')
    silent !mkdir ~/.config/nvim/backups > /dev/null 2>&1
  endif

  set undodir=~/.config/nvim/backups
  set undofile
endif

" ================ Folds ============================

set foldmethod=indent   "fold based on indent
set foldnestmax=3       "deepest fold is 3 levels
set nofoldenable        "dont fold by default

" ================ Completion =======================

set completeopt=menu,menuone,noselect
set wildmode=longest,list,full
set wildmenu
set wildignore=*.o,*.obj,*~
set wildignore+=*vim/backups*
set wildignore+=*sass-cache*
set wildignore+=*DS_Store*
set wildignore+=vendor/rails/**
set wildignore+=vendor/cache/**
set wildignore+=*.gem
set wildignore+=log/**
set wildignore+=node_modules/**
set wildignore+=tmp/**
set wildignore+=*.png,*.jpg,*.gif
set wildignore+=*.class,*.jar
set wildignore+=*.pdf

" ================ Scrolling ========================

set sidescroll=1
set scrolloff=8

" ================ Splitting ========================

set splitbelow
set splitright

" ================ Navigation ========================

nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" ================ Custom Settings ========================

source ~/.config/nvim/settings.vim

" ================ Auto-source config changes  ===========
autocmd! BufWritePost init.vim source %
autocmd! BufWritePost plugs.vim source % | PlugUpgrade | PlugClean! | PlugInstall

" ================ Override ========================

if filereadable(expand("~/.vimrc.after"))
  source ~/.vimrc.after
endif

lua require("ianks.lsp")
lua require("ianks.diagnostic")
lua require("ianks.telescope")
lua require("ianks.treesitter")
lua require("ianks.cmp")
