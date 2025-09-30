# ==================================================================
# A GOOD .ZSHRC CONFIGURATION
# ==================================================================
# Last updated: September 29, 2025

# ------------------------------------------------------------------
# 0. SOURCE OTHER CUSTOM FILES.
# ------------------------------------------------------------------
# Source commands particular to microsoft.
msft_zshrc='$HOME/.zshrc_microsoft'
if [ -n "$msft_zshrc" ] && [ -f "$msft_zshrc" ]; then
    source $msft_zshrc
fi

# ------------------------------------------------------------------
# 1. ENVIRONMENT VARIABLES & PATH
# ------------------------------------------------------------------
# Set the default editor (change 'vim' to 'nano', 'code', etc.)
export EDITOR='vim'

# Set the default pager
export PAGER='less'

# Add useful locations to your command search path ($PATH).
# The order matters. Directories are searched from left to right.
# Example: export PATH="/usr/local/opt/python/libexec/bin:$PATH"
export PATH="/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:$HOME/.local/bin"

# ------------------------------------------------------------------
# 2. HISTORY CONFIGURATION
# ------------------------------------------------------------------
# Larger history file size
HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000

# Shell options for history
setopt APPEND_HISTORY       # Append to history file, don't overwrite
setopt SHARE_HISTORY        # Share history between all running shells
setopt HIST_IGNORE_DUPS     # Don't record consecutive duplicate commands
setopt HIST_IGNORE_SPACE    # Don't record commands starting with a space
setopt HIST_FIND_NO_DUPS    # When searching history, don't show duplicates
setopt HIST_EXPIRE_DUPS_FIRST # Upon history expiry, delete oldest duplicates first

# ------------------------------------------------------------------
# 3. COMPLETION SYSTEM
# ------------------------------------------------------------------
# Enable the Zsh completion system
autoload -U compinit && compinit

# Make completion menu-driven and interactive
zstyle ':completion:*' menu select
zstyle ':completion:*' auto-description 'specify: %d'
zstyle ':completion:*' completer _expand _complete _correct _approximate

# Colorize completions using LS_COLORS
# This requires `ls` to be colorized (see aliases below)
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"

# ------------------------------------------------------------------
# 4. SHELL OPTIONS & KEYBINDINGS
# ------------------------------------------------------------------
# Zsh options to improve quality of life
setopt AUTO_CD              # cd by just typing directory name
setopt EXTENDED_GLOB        # More powerful file matching
setopt NOTIFY               # Report status of background jobs immediately
setopt PROMPT_SUBST         # Allow substitutions in the prompt string
bindkey -e                  # Use Emacs-style key bindings (default)

# ------------------------------------------------------------------
# 5. ALIASES
# ------------------------------------------------------------------
# Create an alias for the 'ls' command that is OS-aware
if [[ "$(uname)" == "Darwin" ]]; then # macOS
  alias ls='ls -G' # Enable colors
else # Linux
  alias ls='ls --color=auto'
fi

# Common ls aliases
alias l='ls -CF'      # With columns and decorators to show type.
alias la='ls -ACF'    # Include hidden files
alias ll='ls -alFh'   # List in long format
alias sl='ls'         # Correct common typo

# Other useful aliases
alias ..='cd ..'
alias ...='cd ../..'
alias grep='grep --color=auto'
alias mkdir='mkdir -p'
alias p='ps -f'

alias pd='pushd'
alias hh='history | less'
alias ssh='ssh -Y'
alias sr="screen -R"
alias less='less -R'

# Example alias for system updates
# Uncomment and adapt for your system
# alias update='sudo apt update && sudo apt upgrade' # Debian/Ubuntu
# alias update='brew update && brew upgrade'          # macOS with Homebrew

# ------------------------------------------------------------------
# 6. FUNCTIONS
# ------------------------------------------------------------------
# Create a directory and cd into it
function mkcd() {
  mkdir -p "$1" && cd "$1"
}

# ------------------------------------------------------------------
# 7. PROMPT
# ------------------------------------------------------------------
# Enable colors and version control info
autoload -U colors && colors
autoload -U vcs_info
zstyle ':vcs_info:*' enable git # Enable Git support

# Format for the git info in the prompt
zstyle ':vcs_info:git:*' formats 'on %F{magenta}%b%f' # 'on <branchname>'

# Set up a hook to run before each prompt is displayed
precmd() {
  # Get git info for the current directory
  vcs_info
}

PROMPT_DIRTRIM=6
# The actual prompt string (two lines)
# Line 1: [Time] [Current Directory] [Git Branch]
# Line 2: $
PROMPT='[%F{yellow}%T%f] [%F{cyan}%~%f] ${vcs_info_msg_0_}
$ '

export TERM=xterm-256color   # xterm-256color does not work within tmux/screen

# Command prompt
