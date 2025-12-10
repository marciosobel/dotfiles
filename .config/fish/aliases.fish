alias vim=nvim

alias l='lsd -1A --group-directories-first --color=always'
alias ls='lsd'
alias la='lsd -l --permission=octal'
alias tree='lsd --tree'

alias gl='git log --graph --all --pretty=format:"%C(magenta)%h %C(white) %an  %ar%C(auto)  %D%n%s%n"'
alias gs='git status --short'
alias gc='git commit'
alias gc!='git commit --amend'
alias gc!!='git commit --amend --no-edit'

alias clock='tty-clock -ct -C 5'

alias kubectl='minikube kubectl --'

alias icat='kitty icat'
