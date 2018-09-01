alias docker-ip="docker inspect --format '{{ .NetworkSettings.IPAddress }}'"
alias rm="echo Use 'trash', or the full path i.e. '/bin/rm' if you really want to"
alias safe-rm="echo Use 'trash', or the full path i.e. '/bin/rm' if you really want to"
command -v gvfs-trash >/dev/null 2>&1 && ! command -v trash >/dev/null 2>&1 && sudo ln -s /usr/bin/gvfs-trash /usr/bin/trash
alias updatedb="sudo /usr/libexec/locate.updatedb"
alias brew-dep='brew list | while read cask; do echo -n $fg[blue] $cask $fg[white]; brew deps $cask | awk '"'"'{printf(" %s ", $0)}'"'"'; echo ""; done'
alias tn="terminal-notifier -sound default -message "
