
" tayo

"Colorscheme
set t_Co=256    "enable 256 color support in vim
let g:lucius_style="light"
let g:moria_style="light"
let g:inkpot_black_background=0
colorscheme moria  "zenburn256,lucius,wombat256,moria,xoria256,jellybeans
syntax on

"set background=dark
set tabstop=2
set shiftwidth=2
"set smartindent "apparently deprecated..
set autoindent
set showmatch   "match parentheses
set matchtime=3
set expandtab   "change tabs into four spaces
set incsearch   "searches in realtime as you type
set ruler
set hlsearch
set title        "set term title to filename, etc
set textwidth=80
set wrap
set modeline
set ls=2
"set mouse=a     "enable mouse usage

"set paste   "paste things without worrying about indenting 'nopaste' to turn off
set pastetoggle=<F2>

set cursorline  "highlight line containing the cursor
autocmd WinEnter * set cursorline  "only active window shows cursor line
autocmd WinLeave * set nocursorline
"hi CursorLine cterm=NONE ctermbg=black


set tags=./tags;/

set wildmenu wildmode=longest:full

"set foldmethod=indent
"set foldminlines=24
"set foldnestmax=4


""Custom Keyboard Mappings
"use CTRL-N to remove highlighted search terms
nmap <silent> <C-N> :silent noh<CR>h 
"CTRL-[J|K|H|L] to move between windows
map <C-J> <C-W>j 
map <C-K> <C-W>k
map <C-H> <C-W>h
map <C-L> <C-W>l

filetype on
autocmd FileType cc,c,cpp,h :set cindent
autocmd FileType make :set noexpandtab      "use hard tabs in Makefiles
autocmd FileType perl :hi Comment ctermfg=Blue  
autocmd FileType tex :map <silent> <C-V> :s/^/%/<CR><C-N><CR>
autocmd Filetype stata :set ft=sh
"autocmd FileType tex :map <silent> <C-?> :s/^/%/<CR><C-N><CR>

:set cinoptions=(0,1N,g2,h2,:2,=2

" automatically change working dir to that of current file
if exists('+autochdir')
  set autochdir
else
  autocmd BufEnter * silent! lcd %:p:h:gs/ /\\ /
endif

let g:netrw_liststyle=3 "use hierarchical listing in netrw
let g:netrw_browse_split=4 "open new file in preview window   

au BufRead,BufNewFile *.maxj set filetype=java "maxeler maxj files are java

"set spell   "turn on spell-checking

"Gvim options
if has("gui_running")
  :set guifont=Monospace\ 10
  set lines=50 columns=100
  :set guioptions-=T  "remove toolbar
  :set guioptions-=r  "remove right-hand scrollbar
  :set guioptions-=L  "remove left-hand scrollbar
endif
