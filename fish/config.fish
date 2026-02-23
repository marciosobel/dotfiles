if status is-interactive
    # Remove welcome message
    set fish_greeting

    # Commands to run in interactive sessions can go here
end

eval (ssh-agent -c) >/dev/null

set -gx nvm_default_version lts
nvm use --silent default

zoxide init --cmd cd fish | source

set -gx PNPM_HOME "/home/marci/.local/share/pnpm"
if not string match -q -- $PNPM_HOME $PATH
    set -gx PATH "$PNPM_HOME" $PATH
end
set -gx ANDROID_SDK_ROOT $HOME/Android/Sdk

set -gx PATH "$HOME/go/bin" $PATH
set -gx PATH "$HOME/.config/fish/scripts" $PATH

# env
set -gx EDITOR helix
set -gx CARGO_TARGET_DIR "$HOME/.cargo/shared_target"

# aliases
alias vim=nvim
alias hx=helix
alias zed=zeditor

alias l='lsd -1A --group-directories-first --color=always'
alias ls='lsd'
alias la='lsd -l --permission=octal'
alias tree='lsd --tree'

alias ga='git add'
alias gl='git log --graph --all --pretty=format:"%C(magenta)%h %C(white) %an  %ar%C(auto)  %D%n%s%n"'
alias gs='git status --short'
alias gc='git commit'
alias gcm='git commit --message'
alias gc!='git commit --amend'
alias gc!!='git commit --amend --no-edit'
alias gp='git push'
alias gp!='git push --force'
alias grb='git rebase'
alias grbi='git rebase -i'
alias gb='git branch'
alias gsb='git switch'
alias gr='git restore'

alias clock='tty-clock -ct -C 5'

alias kubectl='minikube kubectl --'

alias icat='kitty icat'

alias paci='sudo pacman -S' # Install
alias pacr='sudo pacman -Rs' # Remove
alias pacs='pacman -Ss' # Search
alias paclo='pacman -Qdt' # List orphans
alias pacro='sudo pacman -Rns $(pacman -Qtdq)' # Remove orphans
alias pacc='sudo pacman -Scc' # Clean cache
alias paclf='pacman -Ql' # List files
alias pacu='sudo pacman -Syu' # System update

alias yayi='yay -S --needed' # Install
alias yayr='yay -R' # Remove

alias z='zellij'
alias za='zellij attach'

alias ollama='docker exec -it ollama ollama'
