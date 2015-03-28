autoload -U compinit
autoload colors
compinit
colors

# Env Vars
export EDITOR=vim
export CLICOLOR=1
export CDPATH=~:~/src/:~/src/work

# Options
setopt nonomatch # allow us to do bracket-based commands without ugliness
setopt EXTENDED_HISTORY # add timestamps to history
setopt LOCAL_OPTIONS # allow functions to have local options
setopt LOCAL_TRAPS # allow functions to have local traps
setopt PROMPT_SUBST
setopt COMPLETE_IN_WORD
setopt IGNORE_EOF
setopt AUTO_CD
setopt HIST_IGNORE_DUPS
setopt APPEND_HISTORY # adds history
setopt INC_APPEND_HISTORY SHARE_HISTORY  # adds history incrementally and share it across sessions
setopt HIST_IGNORE_ALL_DUPS  # don't record dupes in history
setopt HIST_REDUCE_BLANKS

#Completion
zstyle ':completion::complete:*' use-cache 1
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}' # case insensitive completion
zstyle ':completion:*:default' menu 'select=0' # menu-style

# Functions
git_prompt_info() {
  ref=$($(which git) symbolic-ref HEAD 2> /dev/null) || return
  mods=$(vcprompt -f %m) || return
  echo "%{$reset_color%}(%{$fg[red]%}${ref#refs/heads/}%{$fg[yellow]%}${mods}%{$reset_color%})"
}

# Prompt
export PROMPT='%m%{$reset_color%}:%{$fg[cyan]%}%c$(git_prompt_info) %{$reset_color%}%% '

# Aliases
alias bx="bundle exec"
alias be="bundle exec"
alias ls="ls -lh"
alias gs='git status'
alias gd='git diff'
alias gds='git diff --staged'
alias gca="git commit --amend --no-edit"
alias tmux="TERM=screen-256color-bce tmux new zsh"
alias python=python3

# Bindings
bindkey -M viins '^R' history-incremental-pattern-search-backward
bindkey -M viins '^F' history-incremental-pattern-search-forward
bindkey -M viins '^P' up-history
bindkey -M viins '^N' down-history

typeset -U path cdpath fpath
