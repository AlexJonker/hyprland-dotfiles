rm -rf ./files

ITEMS=(
  "$HOME/.config/ghostty"
  "$HOME/.config/mango"
  "$HOME/.config/vibepanel"
  "$HOME/.config/zlaunch"
  "$HOME/.config/opencode/tui.json"
  "$HOME/.themes/Gruvbox-B-MB-Dark-Soft-Square"
  "$HOME/.icons/Gruvbox-Plus-Dark"
)

for src in "${ITEMS[@]}"; do
  dest="./files${src/$HOME/}"

  mkdir -p "$(dirname "$dest")"

  cp -r "$src" "$dest"
done