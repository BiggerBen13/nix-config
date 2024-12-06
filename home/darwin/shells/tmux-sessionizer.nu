module tmux-sessionizer {
    const custom_dirs = [ ~/nix ]
    const project_dirs = [ ~/projects, ~/.config ]

    def get_tmux [] {
        ps |
            where name == tmux |
            get --ignore-errors pid.0 |
            default null
    }

    export def get-project-dirs [] {
        let project_dirs = [ '~/projects', '~/.config' ]
        let out = ($project_dirs | 
            each {||
                let p = $in;
                $in |
                path expand |
                ls $in |
                where type == dir
                | get name
                | each {||
                    $'($p)/($in | path relative-to $p)'
                }
            } | flatten) ++ ($custom_dirs)
        return $out
    }

    export def main [] {
        let selected_project = get-project-dirs |
                               str join "\n" | 
                               fzf |
                               into string |
                               str trim

        let selected_name = $selected_project | path basename

        if (get_tmux) == null {
            tmux new-session -s $selected_name -c ($selected_project | path expand)
            return
        }
        if (tmux has-session -t=($selected_name) | complete | get exit_code | into bool) {
            tmux new-session -ds $selected_name -c ($selected_project | path expand)
        }

        if ("tmux" in $env.TERM) {
            tmux switch-client -t $selected_name
            return
        }
        
        tmux attach -t $selected_name
    }
}
