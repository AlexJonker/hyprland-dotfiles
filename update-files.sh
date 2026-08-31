#!/usr/bin/env bash
set -euo pipefail

ITEMS=(
  "$HOME/.config/foot"
  "$HOME/.config/mango"
  "$HOME/.config/xdg-desktop-portal"
  "$HOME/.config/vibepanel"
  "$HOME/.config/zlaunch"
  "$HOME/.config/opencode/tui.json"
  "$HOME/.config/Equicord/themes"
  "$HOME/.config/veila"
  "$HOME/.config/paru"
  "$HOME/.config/fish/config.fish"
  "$HOME/.config/iris"
  "$HOME/.config/Thunar/uca.xml"

  "$HOME/.nanorc"

  "$HOME/.local/share/themes"
  "$HOME/.local/share/icons"
)

usage() {
  echo "Usage: $0 [--upload | --apply]"
  echo "  --upload   copy system files into ./files"
  echo "  --apply    copy ./files onto the system"
  exit 1
}

get_dest() {
  local src="$1"
  if [[ "$src" == "$HOME"* ]]; then
    echo "./files/home${src#$HOME}"
  else
    echo "./files${src}"
  fi
}

upload() {
  rm -rf ./files/home
  for src in "${ITEMS[@]}"; do
    dest="$(get_dest "$src")"
    mkdir -p "$(dirname "$dest")"
    cp -r "$src" "$dest"
  done
  echo "Uploaded system files into ./files"
}

apply() {
  for src in "${ITEMS[@]}"; do
    dest="$(get_dest "$src")"
    if [[ ! -e "$dest" ]]; then
      echo "Skipping (not in repo): $dest"
      continue
    fi

    mkdir -p "$(dirname "$src")"
    rm -rf "$src"
    cp -r "$dest" "$src"
  done
  echo "Applied ./files onto the system"
}

[[ $# -eq 1 ]] || usage

case "$1" in
  --upload) upload ;;
  --apply)  apply ;;
  *) usage ;;
esac