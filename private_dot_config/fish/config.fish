if status is-interactive
    # Commands to run in interactive sessions can go here

    function y
        set tmp (mktemp -t "yazi-cwd.XXXXXX")
        command yazi $argv --cwd-file="$tmp"
        if read -z cwd <"$tmp"; and [ "$cwd" != "$PWD" ]; and test -d "$cwd"
            builtin cd -- "$cwd"
        end
        rm -f -- "$tmp"
    end

    abbr --add rebuild_flake sudo nixos-rebuild switch --flake .#desktop

    abbr --add lg lazygit
    abbr --add edit_niri_config chezmoi edit ~/.config/niri/config.kdl
    abbr --add edit_fish_config chezmoi edit ~/.config/fish/config.fish
    abbr --add edit_kitty_config chezmoi edit ~/.config/kitty/kitty.conf
    abbr --add edit_wlr_config chezmoi edit ~/.config/wlr-which-key/config.yaml
    abbr --add edit_chezmoi_machine_config hx ~/.config/chezmoi/chezmoi.toml
end

set fish_greeting
