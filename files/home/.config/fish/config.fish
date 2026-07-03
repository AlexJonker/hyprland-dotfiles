set -g fish_greeting

if status is-interactive
    starship init fish | source
    pfetch
end



# List Directory
alias ls="lsd"
alias l="ls -l"
alias la="ls -a"
alias lla="ls -la"
alias lt="ls --tree"

alias py="python"
alias yeet-orphans="paru -Rns (paru -Qtdq)"
alias yeet="paru -Rns"
alias clear="clear && pfetch"


#change default editor
export VISUAL="nano"
export EDITOR="nano"

#set kitty as default terminal
export TERM=ghostty
