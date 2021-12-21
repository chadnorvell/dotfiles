function clt() { cd "$@" && tree -L 2; }
function cla() { cd "$@" && ls -la; }

# Git
alias ga="git add -A"
alias gamend="git commit --amend"
alias gb="git branch"
alias gc="git checkout"
alias gcb="git checkout -b"
alias gclear="git checkout ${1-master} && git branch --merged ${1-master} | grep -v ' ${1-master}$' | xargs git branch -d"
alias gclearall="git branch | grep -v 'master' | xargs git branch -D"
alias gcm="git commit -m "
alias gfresh="git pull --rebase --prune"
alias glog="git log --oneline -10"
alias gs="git status"
alias gundo="git reset HEAD~1 --mixed"
alias gwip="git add -A && git commit -m '~~WIP~~'"

# Ubuntu
alias apt-list-manually-installed="comm -23 <(aptitude search '~i !~M' -F '%p' | sed 's/ *$//' | sort -u) <(gzip -dc /var/log/installer/initial-status.gz | sed -n 's/^Package: //p' | sort -u)"
