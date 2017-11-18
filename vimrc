" Welcome to Vim (http://go/vim).
"
" If you see this file, your homedir was just created on this workstation.
" That means either you are new to Google (in that case, welcome!) or you
" got yourself a faster machine.
" Either way, the main goal of this configuration is to help you be more
" productive; if you have ideas, praise or complaints, direct them to
" vi-users@google.com (http://g/vi-users). We'd especially like to hear from you
" if you can think of ways to make this configuration better for the next
" Noogler.
" If you want to learn more about Vim at Google, see http://go/vimintro.

" Enable modern Vim features not compatible with Vi spec.
set nocompatible

" Use the 'google' package by default (see http://go/vim/packages).
source /usr/share/vim/google/google.vim


" Enable and configure Google plugins
" ===================================
let mapleader=","

Glug youcompleteme-google
let g:ycm_goto_buffer_command = 'horizontal-split'
let g:ycm_always_populate_location_list = 1  "quick jumping to errors
"<Comma-]"
nnoremap <Leader>] :YcmCompleter GoTo<CR>
nnoremap <Leader>F :YcmCompleter FixIt<CR>
nnoremap <Leader>T :YcmCompleter GetType<CR>
nnoremap <Leader>P :YcmCompleter GetParent<CR>

Glug codefmt
Glug codefmt-google
augroup autoformat_settings
  autocmd FileType c,cpp NoAutoFormatBuffer
  autocmd FileType bzl AutoFormatBuffer buildifier
  autocmd FileType go AutoFormatBuffer gofmt
  autocmd FileType proto AutoFormatBuffer clang-format
  "autocmd FileType python AutoFormatBuffer pyformat
  autocmd FileType markdown AutoFormatBuffer mdformat
augroup END

Glug syntastic-google

"Glug grok

" Enable file type based indent configuration and syntax highlighting.
" Note that when code is pasted via the terminal, vim by default does not detect
" that the code is pasted (as opposed to when using vim's paste mappings), which
" leads to incorrect indentation when indent mode is on.
" To work around this, use ":set paste" / ":set nopaste" to toggle paste mode.
" You can also use a plugin to:
" - enter insert mode with paste (https://github.com/tpope/vim-unimpaired)
" - auto-detect pasting (https://github.com/ConradIrwin/vim-bracketed-paste)
filetype plugin indent on
syntax on



"tayo's external vimrc config below

"Colorscheme
set t_Co=256    "enable 256 color support in vim
let g:lucius_style="dark"
let g:moria_style="light"
let g:inkpot_black_background=0
colorscheme moria_tayo  "moria,zenburn256,lucius,wombat256,xoria256,jellybeans,molokai
syntax on

"set background=dark
set tabstop=2
set shiftwidth=2
"set cindent
"set smartindent "apparently deprecated..
set autoindent
set showmatch   "match parentheses
set matchtime=3
set expandtab   "change tabs into spaces
set incsearch   "searches in realtime as you type
set ruler
set hlsearch
set title        "set term title to filename, etc
set textwidth=80
set wrap
set modeline
set ls=2
set number       "line numbers
"set mouse=a     "enable mouse usage

"set paste   "paste things without worrying about indenting 'nopaste' to turn off
set pastetoggle=<F2>

set cursorline  "highlight line containing the cursor
autocmd WinEnter * set cursorline  "only active window shows cursor line
autocmd WinLeave * set nocursorline


set tags=./tags;/

set wildmenu wildmode=longest:full

"set foldmethod=indent
"set foldminlines=24
"set foldnestmax=4


"Keyboard Mappings
"=================

command Bgd execute "set bg=dark"
command Bgl execute "set bg=light"
command FC execute "FormatCode"
" the following does not work with a range..
command FL execute "FormatLines"

"use CTRL-N to remove highlighted search terms
nmap <silent> <C-N> :silent noh<CR>h

"CTRL-[J|K|H|L] to move between windows
map <C-J> <C-W>j
map <C-K> <C-W>k
map <C-H> <C-W>h
map <C-L> <C-W>l
"CTRL-P: open file under cursor in new split window
map <C-P> <C-W>f

" set wfh (make window height static), wfw (window width static)

"filetype on
"autocmd FileType cc,c,cpp,h :set cindent
"autocmd FileType make :set noexpandtab      "use hard tabs in Makefiles
"autocmd FileType perl :hi Comment ctermfg=Blue
"autocmd FileType tex :map <silent> <C-V> :s/^/%/<CR><C-N><CR>
"autocmd Filetype stata :set ft=sh
"autocmd FileType tex :map <silent> <C-?> :s/^/%/<CR><C-N><CR>

":set cinoptions=(0,1N,g2,h2,:2,=2

" automatically change working dir to that of current file
if exists('+autochdir')
  set autochdir
else
  autocmd BufEnter * silent! lcd %:p:h:gs/ /\\ /
endif

let g:netrw_liststyle=3 "use hierarchical listing in netrw
let g:netrw_browse_split=4 "open new file in preview window
let g:netrw_altv=1 "open new file in vertical split (autochdir focuses there)
:set noea
:set nosplitright

"au BufRead,BufNewFile *.maxj set filetype=java "maxeler maxj files are java
au BufRead,BufNewFile *.cu  set filetype=c "use C-style options for CUDA files

"set spell   "turn on spell-checking

"Gvim options
if has("gui_running")
  ":set guifont=Monospace\ 10
  :set guifont=Ubuntu\ Mono\ 11
  set lines=60 columns=180
  :set guioptions-=m  "remove menubar (File, Edit, etc)
  :set guioptions-=T  "remove toolbar
  :set guioptions-=r  "remove right-hand scrollbar
  :set guioptions-=L  "remove left-hand scrollbar
endif

set vb t_vb=       "turn off all audible bells etc
