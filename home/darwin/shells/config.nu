def fw [] {
    aerospace list-windows --all | fzf --bind 'enter:execute(bash -c "aerospace focus --window-id {2}")+abort'
}

$env.config = {
    edit_mode: vim
    table_mode: heavy
}
