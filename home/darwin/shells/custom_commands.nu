use ./tmux-sessionizer
use ../../../util.nu

def fw [] {
    aerospace list-windows --all | fzf --bind 'enter:execute(bash -c "aerospace focus --window-id {1}")+abort'
}

