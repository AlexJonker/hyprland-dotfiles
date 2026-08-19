source ~/.cache/iris/colors.fish

set -g fish_greeting

if status is-interactive
    starship init fish | source
    pfetch
end


# Alias dinit's power commands to loginctl's power commands
alias shutdown="loginctl poweroff"
alias reboot="loginctl reboot"
alias suspend="loginctl suspend"
alias hibernate="loginctl hibernate"

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


# Change default editor
export VISUAL="nano"
export EDITOR="nano"
