#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias l='ls -la --color=auto'
alias grep='grep --color=auto'
alias dirs='dirs -v'

#config
alias cfggit='/usr/bin/git --git-dir="$HOME/.dotfiles/" --work-tree="$HOME"'

# export EDITOR=nvim
# export VISUAL=nvim

prompt() {
    #PS1='\n\[\033[1;32m\][$SHLVL][\[\e]0;\u@\h: \w\a\]\u@\h:\w]\$ \n|>\[\033[0m\] '
    PS1='\n\[\033[1;32m\][$SHLVL][\[\e]0;\u@\h: \w\a\]\u@\h:\w]\[\033[0m\]\n\[\033[1;32m\]\$\[\033[0m\] '
}
PROMPT_COMMAND=prompt


eval "$(fzf --bash)"
eval "$(zoxide init bash --cmd cd)"
