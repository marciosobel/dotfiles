#!/bin/bash

DOTFILES_DIR="$HOME/.dotfiles"
CONFIG_DIR="${XDG_CONFIG_HOME:-$HOME/.config}"
REPO_URL="https://github.com/marciosobel/dotfiles"

command -v git >/dev/null 2>&1 || { echo "git is required but not installed."; exit 1; }

if [ ! -d "$DOTFILES_DIR" ]; then
  echo "Cloning dotfiles..."
  git clone "$REPO_URL" "$DOTFILES_DIR"
fi

cd "$DOTFILES_DIR" || {
  echo "Failed to enter $DOTFILES_DIR"
  exit 1
}

mkdir -p "$CONFIG_DIR"

for dir in */; do
  app="${dir%/}" # Remove trailing slash

  case "$app" in
    .git|screenshots) continue;;
  esac

  # Backup existing config if it's a real folder/file (not a link)
  if [ -e "$CONFIG_DIR/$app" ] && [ ! -L "$CONFIG_DIR/$app" ]; then
      echo "Backing up existing $app config..."
      backup_dir="$CONFIG_DIR/${app}_$(date +%Y%m%d_%H%M%S).bak"
      mv "$CONFIG_DIR/$app" "$backup_dir"
      echo "$app config saved at $backup_dir"
  fi

  echo "Creating symlink for $app..."
  ln -sfn "$(pwd)/$app" "$CONFIG_DIR/$app"
  echo "Linked $app."
done

echo "Done."
