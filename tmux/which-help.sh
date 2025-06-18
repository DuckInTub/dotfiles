#!/bin/bash

list_keybindings() {
    clear # Clear previous content in the popup for a clean display
    echo "Tmux cheat sheet:"
    echo ""
    printf "%-5s %-25s %-5s %-25s\n" \
        "[C]" "Create new window" "[D]" "Detach current session" \
        "[\"]" "Split window (horiz)" "[%]" "Split window (vert)" \
        "[H]" "Move pane left" "[L]" "Move pane right" \
        "[K]" "Move pane up" "[J]" "Move pane down" \
        "[N]" "Next window" "[P]" "Previous window" \
        "[X]" "Kill current pane" "[Z]" "Zoom pane" \
        "[T]" "Toggle clock mode" "[?]" "Show these keybindings"
    echo ""
    echo "Press a key to execute, or '?' for help."
}


list_keybindings

read -n 1 -s key

if [[ "$key" =~ ^[A-Za-z]+$ ]]; then
	key="${key,,}" # Convert to lowercase
fi

echo "You pressed: $key"

case "$key" in
    c) tmux new-window ; echo "Created a new window." ;;
    d) tmux detach-client ; echo "Detached from the current session." ;;
    \") tmux split-window -h ; echo "Split window horizontally." ;;
    %) tmux split-window -v ; echo "Split window vertically." ;;
    h) tmux select-pane -L ; echo "Moved pane left." ;;
    l) tmux select-pane -R ; echo "Moved pane right." ;;
    k) tmux select-pane -U ; echo "Moved pane up." ;;
    j) tmux select-pane -D ; echo "Moved pane down." ;;
    n) tmux next-window ; echo "Moved to next window." ;;
    p) tmux previous-window ; echo "Moved to previous window." ;;
    x) tmux kill-pane ; echo "Killed the current pane." ;;
    z) tmux resize-pane -Z ; echo "Toggled pane zoom." ;;
    t) tmux clock-mode ; echo "Toggled clock mode." ;;
esac
