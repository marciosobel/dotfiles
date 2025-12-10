set FISH_CONFIG_DIR ~/.config/fish

if status is-interactive
    # Commands to run in interactive sessions can go here
end

eval (ssh-agent -c) > /dev/null

source $FISH_CONFIG_DIR/env.fish
source $FISH_CONFIG_DIR/aliases.fish

set -gx PATH $FISH_CONFIG_DIR/scripts $PATH
set -gx PATH ~/Downloads/tsuru $PATH

set -gx nvm_default_version lts
nvm use --silent default

# zoxide
zoxide init --cmd cd fish | source

# pnpm
set -gx PNPM_HOME "/home/marci/.local/share/pnpm"
if not string match -q -- $PNPM_HOME $PATH
  set -gx PATH "$PNPM_HOME" $PATH
end
# pnpm end

# awrit
set --export PATH /home/marci/.local/bin $PATH

# android studio
set -gx ANDROID_SDK_ROOT $HOME/Android/Sdk
