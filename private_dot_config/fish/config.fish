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

    function add_package
        cd ~/dend_nixos/modules/features/
        hx ~/dend_nixos/modules/features/primary_env.nix +32
    end

    function sshfs_mount
        sshfs admin@192.168.0.187:/etc/nixos/ /home/luke/server_etc/ -o reconnect,ServerAliveInterval=15,ServerAliveCountMax=3
        sshfs admin@192.168.0.187:/etc/dockerfiles/ ~/server_dockerfiles/ -o reconnect,ServerAliveInterval=15,ServerAliveCountMax=3
    end

    function sshfs_unmount
        fusermount -u ~/server_etc
        fusermount -u ~/server_dockerfiles/
    end

    function sshfs_clean
        fusermount -uz /home/luke/remote_server_etc
        fusermount -uz /home/luke/remote_dockerfiles
    end

    bind \cy copy-commandline

    abbr --add rebuild_flake sudo nixos-rebuild switch --flake .#desktop

    abbr --add lg lazygit
    abbr --add edit_niri_config chezmoi edit ~/.config/niri/config.kdl
    abbr --add edit_fish_config chezmoi edit ~/.config/fish/config.fish
    abbr --add edit_kitty_config chezmoi edit ~/.config/kitty/kitty.conf
    abbr --add edit_wlr_config chezmoi edit ~/.config/wlr-which-key/config.yaml
    abbr --add edit_chezmoi_machine_config hx ~/.config/chezmoi/chezmoi.toml
    abbr --add apply_config chezmoi apply
    abbr --add lg_dotfiles lazygit -p ~/.local/share/chezmoi/
    abbr --add ssh_server ssh -X admin@192.168.0.187
end
set fish_greeting
# why
