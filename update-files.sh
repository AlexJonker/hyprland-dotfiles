rm -rf ./files

ITEMS=(
  "$HOME/.config/ghostty"
  "$HOME/.config/mango"
  "$HOME/.config/vibepanel"
  "$HOME/.config/zlaunch"
  "$HOME/.config/opencode/tui.json"
  "$HOME/.config/Equicord/themes"

  "$HOME/.themes/Gruvbox-B-MB-Dark-Soft-Square"
  "$HOME/.icons/Gruvbox-Plus-Dark"

  "/usr/share/sddm/themes/gruvbox"
  "/etc/sddm.conf"
)

for src in "${ITEMS[@]}"; do
  if [[ "$src" == "$HOME"* ]]; then
      dest="./files/home${src#$HOME}"
  else
      dest="./files${src}"
  fi

  mkdir -p "$(dirname "$dest")"

  cp -r "$src" "$dest"
done
