###
### --- ZINIT -----------------------------------------------
###
# Set the directory where to store zinit and plugins
ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"

# Download Zinit, if it's not there yet
if [ ! -d "$ZINIT_HOME" ]; then
  mkdir -p "$(dirname $ZINIT_HOME)"
  git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
fi

# Source/Load zinit
source "${ZINIT_HOME}/zinit.zsh"

### --- HISTORY ---------------------------------------------
export HISTFILE=~/.histfile
export HISTSIZE=1000
export SAVEHIST=$HISTSIZE
export HISTDUP=erase

setopt hist_ignore_dups
setopt hist_ignore_space
setopt hist_ignore_all_dups
setopt hist_find_no_dups
setopt hist_save_no_dups
setopt appendhistory
setopt sharehistory
setopt incappendhistory

### ---- PLUGINS & THEMES -----------------------------------

# Plugins
zinit light z-shell/F-Sy-H
zinit light zsh-users/zsh-completions
zinit light zsh-users/zsh-autosuggestions
# zinit light Aloxaf/fzf-tab
zinit light unixorn/fzf-zsh-plugin

# Snippets
zinit snippet OMZP::sudo
zinit snippet OMZP::archlinux
zinit snippet OMZP::command-not-found

# Load completions
autoload -Uz compinit && compinit 

zinit cdreplay -q

### --- OPTIONS & KEYBINDINGS -------------------------------
setopt autocd extendedglob

unsetopt beep

bindkey -v

bindkey "^H"      backward-kill-word # CTRL + Backspace 
bindkey "^[[H"    beginning-of-line  # CTRL + -->
bindkey "^[[F"    end-of-line        # CTRL + <--
bindkey "^[[3~"   delete-char
bindkey "^[[1;5C" forward-word
bindkey "^[[1;5D" backward-word
bindkey "^p"      history-search-backward
bindkey "^n"      history-search-forward
bindkey "^f"      autosuggest-accept

# Styling
zstyle :compinstall filename '/home/rasti/.zshrc'
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
zstyle ':completion:*' menu no

# export MANPAGER="less -R --use-color -Dd+r -Du+b" # syntax highlighting for man pages using less

## --- ALIASES ----------------------------------------------

# --- fzf and fd ---
# changed fdfind command on ubuntu to fd with this command 'ln -s $(which fdfind) ~/.local/bin/fd'
export FZF_DEFAULT_COMMAND="fd --follow --hidden --exclude .git"
export FZF_DEFAULT_OPTS="--ansi --layout=reverse --border"
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND --type f"
export FZF_ALT_C_COMMAND="$FZF_DEFAULT_COMMAND --type d"

# --- Add color ---
alias grep="grep --color=auto"
alias ls="ls --color=auto"
alias fd="fd --color=always"

alias ll="ls -laXv --group-directories-first"
alias la="ls -A"
alias l="ls -CF"

alias lg="lazygit"
alias config="nvim $ZSH"
alias projects="cd $HOME/dev"
alias reload="source $HOME/.zshrc"
alias myip="curl http://ipecho.net/plain; echo"

# --- INITIALIZATIONS -------------------------------------
eval "$(~/.local/bin/mise activate zsh)"
eval "$(zoxide init --cmd cd zsh)"
eval "$(oh-my-posh init zsh --config $HOME/.config/ohmyposh/zen.toml)"
eval "$(batman --export-env)"

