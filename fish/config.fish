if status is-interactive
    # Commands to run in interactive sessions can go here
    fastfetch
    # Remove welcome message
    set fish_greeting
end

set -gx PATH $PATH "/home/marci/.julia/bin"

eval (ssh-agent -c) >/dev/null

set -gx nvm_default_version lts
nvm use --silent default

zoxide init --cmd cd fish | source

set -gx PNPM_HOME "/home/marci/.local/share/pnpm"
if not string match -q -- $PNPM_HOME $PATH
    set -gx PATH "$PNPM_HOME" $PATH
end

set -gx ANDROID_SDK_ROOT $HOME/Android/Sdk

# env
set -gx EDITOR helix

# aliases
alias vim=nvim
alias hx=helix
