export def commit-generation [note?: string] {
    let note = (match $note {
        null => {""},
        _ => {$"note: ($note)"}
    })
    let generations = darwin-rebuild --flake ~/nix --list-generations
        | lines
        | str trim
        | split column --regex '\s+' generation date time current
    let current_generation = $generations | where current? != null
    let message = $"GEN: ($current_generation.generation) on: ($current_generation.date) at: ($current_generation.time)" + " " + $note
   git commit -am $message
}

export def darwin-switch [note?: string] {
    git diff -U0
    nix fmt
    darwin-rebuild switch --flake ~/nix
    commit-generation $note
}
