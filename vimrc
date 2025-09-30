" ============================================================================
" VIM CONFIGURATION FILE (Revised for Clarity and Modern Practices)
" ============================================================================

" --- 1. GENERAL SETUP & CORE BEHAVIOR ---
" ----------------------------------------------------------------------------
set nocompatible              " Use modern Vim features, not Vi-compatible
filetype plugin indent on     " Enable filetype detection, plugins, and indentation
let mapleader = ","           " Set the leader key to comma
set vb t_vb=                  " Turn off all audible bells
set title                     " Set terminal title to the current filename
set modeline                  " Allow settings to be defined in files (use with care)
set noea                      " Don't use the 'equalalways' option
set nosplitright              " New vertical splits open to the left
set shell=/bin/zsh            " Example: Explicitly set shell for commands

" --- 2. SOURCING EXTERNAL & LOCAL CONFIGS ---
" ----------------------------------------------------------------------------
" Load company-specific or machine-specific settings first
try
  source /usr/local/google/home/tayo/.vimrc_microsoft
catch
endtry

" Load a local override file for machine-specific tweaks
try
  source ~/.vimrc_local.vim
catch
endtry


" --- 3. UI CONFIGURATION ---
" ----------------------------------------------------------------------------
syntax on                     " Enable syntax highlighting
set t_Co=256                  " Enable 256-color support
set termguicolors             " Enable true color support in compatible terminals

" Colorscheme settings
"   light: moria_tayo,moria,papercolor,lunaperche,gruvbox
"   dark:  gruvbox,habamax,jellybeans,lucius,papercolor,wombat256,xoria256,zenburn256
set bg=dark
let g:lucius_style = "dark"
let g:moria_style = "light"
let g:inkpot_black_background = 0
colorscheme jellybeans

" Line numbers and layout
set number                    " Show line numbers
set ruler                     " Show cursor position in the status line
set showmatch                 " Highlight matching brackets
set matchtime=3               " How long to show matching brackets (in tenths of a second)
set ls=2                      " Always show the status line

" Cursor highlighting
set cursorline                " Highlight the line containing the cursor
autocmd WinEnter * set cursorline " Only show cursorline in the active window
autocmd WinLeave * set nocursorline


" --- 4. EDITING BEHAVIOR ---
" ----------------------------------------------------------------------------
" Indentation
set tabstop=2                 " Number of visual spaces per tab
set shiftwidth=2              " Number of spaces to use for auto-indent
set softtabstop=2             " Number of spaces for tab key and backspace
set expandtab                 " Use spaces instead of tabs
set autoindent                " Copy indent from current line when starting a new line

" Search
set hlsearch                  " Highlight all search matches
set incsearch                 " Show search matches in real-time as you type

" Text wrapping
set textwidth=80              " Wrap lines at 80 characters
set wrap                      " Enable line wrapping

" Command-line completion menu
set wildmenu
set wildmode=longest:full,full

" Directory and file navigation
set tags=./tags;/             " Define the search path for tags files
if exists('+autochdir')
  set autochdir               " Automatically change directory to the current file's dir
endif

" Paste mode toggle
set pastetoggle=<F2>


" --- 5. KEY MAPPINGS ---
" ----------------------------------------------------------------------------
" Clear search highlight with Ctrl+N
nnoremap <silent> <C-N> :silent noh<CR>

" Window navigation with Ctrl + H/J/K/L
nnoremap <silent> <C-J> <C-W>j
nnoremap <silent> <C-K> <C-W>k
nnoremap <silent> <C-H> <C-W>h
nnoremap <silent> <C-L> <C-W>l

" Fast exit from insert mode
inoremap jk <Esc>
inoremap kj <Esc>

" Open file under cursor in a new split
nnoremap <C-P> <C-W>f

" Disable Ctrl+A (number increment), as it's often used by tmux
nnoremap <C-a> <Nop>


" --- 6. FILETYPE-SPECIFIC SETTINGS (AUTOCMD) ---
" ----------------------------------------------------------------------------
augroup filetype_settings
    " Clear existing autocmds in this group to prevent duplicates
    autocmd!

    " Use smart C-style indentation for C-like languages
    autocmd FileType c,cpp,h set smartindent

    " Use hard tabs for Makefiles
    autocmd FileType make set noexpandtab

    " Use C-style options for CUDA files
    autocmd BufRead,BufNewFile *.cu set filetype=c

    " Treat TypeScript files as JavaScript for syntax
    autocmd BufRead,BufNewFile *.ts set filetype=javascript

    " Set Stata files to use Shell syntax
    autocmd FileType stata set filetype=sh

    " Customizations for specific filetypes
    autocmd FileType perl hi Comment ctermfg=Blue
    autocmd FileType tex map <buffer> <silent> <C-V> :s/^/%/<CR><C-N><CR>
augroup END


" --- 7. PLUGIN-SPECIFIC SETTINGS ---
" ----------------------------------------------------------------------------
" Python
let g:python_recommended_style = 0 " Use yapf for formatting

" Netrw (built-in file explorer)
let g:netrw_liststyle = 3      " Use hierarchical tree listing
let g:netrw_browse_split = 4   " Open file in a preview window
let g:netrw_altv = 1           " Open splits vertically


" --- 8. GVIM / GUI SETTINGS ---
" ----------------------------------------------------------------------------
if has("gui_running")
  " Set font based on OS
  if has('mac')
    set guifont=Menlo\ Regular:h12
    set guioptions+=k " Keep window size when resizing
  elseif has('unix')
    set guifont=Ubuntu\ Mono\ 12
  endif

  " Set initial window size
  set lines=50 columns=120

  " Clean up the UI by removing menu, toolbar, and scrollbars
  set guioptions-=m " menubar
  set guioptions-=T " toolbar
  set guioptions-=r " right scrollbar
  set guioptions-=L " left scrollbar
endif


" --- 9. CUSTOM FUNCTIONS & COMMANDS ---
" ----------------------------------------------------------------------------
" Custom commands
command! Bgd execute "set bg=dark"
command! Bgl execute "set bg=light"
command! FC execute "FormatCode"
command! FL execute "FormatLines"
command! TrimWhitespace call TrimWhitespace()

" Function to remove trailing whitespace from a file
function! TrimWhitespace()
    let l:save = winsaveview()
    keeppatterns %s/\s\+$//e
    call winrestview(l:save)
endfunction

" ============================================================================
" END OF VIM CONFIGURATION
" ============================================================================
