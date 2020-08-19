# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# PS1
export PS1="[\[\e[32m\]\u\[\e[m\]\[\e[32m\]@\[\e[m\]\[\e[32m\]\h\[\e[m\]:\[\e[34m\]\w\[\e[m\]] \\$ "


# Add ~/.local.bin to $PATH
if [ -d "$HOME/.local/bin" ]; then
  PATH="$HOME/.local/bin:$PATH"
fi

# ENV Variables
export EDITOR="vim"
export BROWSER="firefox"
export TERMINAL="urxvt"
export READER="zathura"

# Aliases
alias ls='ls --color=auto'
alias ll='ls -lh'
alias la='ls -la'
alias vi='vim'
alias grep='grep --color=always'
