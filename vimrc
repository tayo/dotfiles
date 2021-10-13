" Machine-specific configs

" Enable modern Vim features not compatible with Vi spec.
set nocompatible

try
  source /usr/local/google/home/tayo/.vimrc_google
catch
  " No machine-specific vimrc..
endtry

" Local configs on a given machine
try
  source ~/.vimrc_local.vim
catch
endtry

let mapleader=","


"Colorscheme
set t_Co=256    "enable 256 color support in vim
let g:lucius_style="dark"
let g:moria_style="white"  " white, light, dark, black
let g:inkpot_black_background=0
color moria_tayo "zenburn256,lucius,wombat256,moria_tayo,xoria256,jellybeans,gruvbox
syntax on

"set background=dark
set tabstop=2
set shiftwidth=2
set cindent
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

"
let g:python_recommended_style=0    " Use yapf for formatting

"set paste   "paste things without worrying about indenting 'nopaste' to turn off
set pastetoggle=<F2>

set cursorline  "highlight line containing the cursor
autocmd WinEnter * set cursorline  "only active window shows cursor line
autocmd WinLeave * set nocursorline


set tags=./tags;/

set wildmenu wildmode=longest:full

"Status line: configure this better
"set statusline=%.100F

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
"CTRL-A is useful for tmux. I never use the number increment.
map <C-a> <Nop>


" filetype on
autocmd FileType cc,c,cpp,h :set cindent
autocmd FileType make :set noexpandtab      "use hard tabs in Makefiles
autocmd FileType perl :hi Comment ctermfg=Blue
autocmd FileType tex :map <silent> <C-V> :s/^/%/<CR><C-N><CR>
autocmd Filetype stata :set ft=sh
" set wfh (make window height static), wfw (window width static)
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
au BufRead,BufNewFile *.ts set filetype=javascript "TypeScript == JavaScript

"set spell   "turn on spell-checking

"Gvim options
if has("gui_running")
  ":set guifont=Monospace\ 10
  ":set guifont=Noto\ Mono\ 12
  if has('mac')
    :set guifont=Menlo\ Regular:h12
    :set guioptions+=k  "Keep window size when resizing
  elseif has('unix')
    :set guifont=Ubuntu\ Mono\ 12
  endif

  set lines=50 columns=120
  :set guioptions-=m  "remove menubar (File, Edit, etc)
  :set guioptions-=T  "remove toolbar
  :set guioptions-=r  "remove right-hand scrollbar
  :set guioptions-=L  "remove left-hand scrollbar
endif

set vb t_vb=       "turn off all audible bells etc

fun! TrimWhitespace()
    let l:save = winsaveview()
    keeppatterns %s/\s\+$//e
    call winrestview(l:save)
endfun

command! TrimWhitespace call TrimWhitespace()
