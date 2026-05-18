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

    function copy-commandline
        echo -n (commandline) | wl-copy
    end

    bind \cy copy-commandline

    abbr --add rebuild_flake sudo nixos-rebuild switch --flake .#desktop

    abbr --add lg lazygit
    abbr --add edit_niri_config chezmoi edit ~/.config/niri/config.kdl
    abbr --add edit_fish_config chezmoi edit ~/.config/fish/config.fish
    abbr --add edit_kitty_config chezmoi edit ~/.config/kitty/kitty.conf
    abbr --add edit_wlr_config chezmoi edit ~/.config/wlr-which-key/config.yaml
    abbr --add edit_chezmoi_machine_config hx ~/.config/chezmoi/chezmoi.toml
    abbr --add add_package hx -w ~/dend_nixos/modules/features/ ~/dend_nixos/modules/features/primary_env.nix +32
    abbr --add apply_config chezmoi apply
    abbr --add lg_dotfiles lazygit -p ~/.local/share/chezmoi/
    abbr --add ssh_server ssh -X admin@192.168.0.187
    abbr --add mount_server_configuration sshfs admin@192.168.0.187:/etc/nixos/ ~/Documents/server_etc/
    abbr --add unmount_server_configuration fusermount -u ~/Documents/server_etc
    abbr --add mount_server_dockerfiles sshfs admin@192.168.0.187:/etc/dockerfiles/ ~/Documents/server_dockerfiles/
    abbr --add unmount_server_dockerfiles fusermount -u ~/Documents/server_dockerfiles/
end

set fish_greeting
