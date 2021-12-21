# Activate colored `ls` and `man` output
eval $(gdircolors -b)
alias ls="gls --color"
export LESS="--quit-if-one-screen --ignore-case --status-column --LONG-PROMPT --RAW-CONTROL-CHARS --tabs=4 --no-init --window=4"
export LESS_TERMCAP_mb=$'\E[1;31m'
export LESS_TERMCAP_md=$'\E[1;36m'
export LESS_TERMCAP_me=$'\E[0m'
export LESS_TERMCAP_so=$'\E[01;44;33m'
export LESS_TERMCAP_se=$'\E[0m'
export LESS_TERMCAP_us=$'\E[1;32m'
export LESS_TERMCAP_ue=$'\E[0m'

export PROMPT_HOST='\h'
export WINDOW_TITLE='\[\033]0;\W\007\]'

if [ -f ~/.bash_prompt ]; then
    . ~/.bash_prompt
fi

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

export PAGER="most"
export BAT_THEME="ansi-dark"

# HSTR configuration
alias hh=hstr
export HSTR_CONFIG=hicolor
shopt -s histappend
export HISTCONTROL=ignorespace
export HISTFILESIZE=10000
export HISTSIZE=${HISTFILESIZE}
# ensure synchronization between `bash` memory and history file
export PROMPT_COMMAND="history -a; history -n; ${PROMPT_COMMAND}"
# if this is interactive shell, then bind hstr to Ctrl-r (for Vi mode check doc)
if [[ $- =~ .*i.* ]]; then bind '"\C-r": "\C-a hstr -- \C-j"'; fi
# if this is interactive shell, then bind 'kill last command' to Ctrl-x k
if [[ $- =~ .*i.* ]]; then bind '"\C-xk": "\C-a hstr -k \C-j"'; fi
