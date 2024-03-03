if status is-interactive
    # Commands to run in interactive sessions can go here
    set -g fish_prompt_login_hideable 1

    # Set up asdf (if it has been installed)
    if test -e "$HOME/.asdf/asdf.fish"
        source $HOME/.asdf/asdf.fish
    end
end
