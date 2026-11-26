function __package_command
    set -q argv[2]; or return 2
    command flock --close -- "$__fish_config_dir" fish --no-config --command '
        source "$__fish_config_dir/functions/__package_command.fish"; or exit
        __package_command_locked $argv
    ' -- $argv
end

function __package_command_locked --argument-names action
    set -e argv[1]
    set -l config_dir (path dirname -- "$__fish_config_dir")
    set -l pacman_list "$config_dir/packages-pacman.txt"
    set -l yay_list "$config_dir/packages-yay.txt"
    set -l manifests
    set -l explicit_before
    set -l installed_before
    set -l installed_after

    if test "$action" = remove
        set installed_before (command pacman -Qq); or return
    else
        set explicit_before (command pacman -Qqe); or return
    end

    switch "$action"
        case install
            command sudo pacman -Syu -- $argv; or return
            set manifests "$pacman_list"
        case install-yay
            command yay -- $argv; or return
            set manifests "$yay_list"
        case remove
            command sudo pacman -Runs -- $argv; or return
            set installed_after (command pacman -Qq); or return
            set manifests "$pacman_list" "$yay_list"
    end

    set -l selected
    if test "$action" != remove
        set -l explicit_after (command pacman -Qqe); or return
        set -l candidates
        if test "$action" = install
            set -l targets (string replace -r '^[^/]+/' '' -- $argv)
            set selected (command pacman -Qq -- $targets 2>/dev/null)
            # Only add group members that became explicit during this install.
            set candidates (command pacman -Qqg -- $targets 2>/dev/null)
        else
            # Yay arguments are search terms, so track what the user selected.
            set candidates $explicit_after
        end

        for package in $explicit_after
            if contains -- "$package" $candidates; and not contains -- "$package" $explicit_before
                set -a selected "$package"
            end
        end
    end

    for manifest in $manifests
        set -l packages
        if test -e "$manifest"
            set packages (command cat -- "$manifest"); or return
        end

        set -l kept $selected
        for package in $packages
            if contains -- "$package" $installed_before; and not contains -- "$package" $installed_after
                continue
            end
            set -a kept "$package"
        end
        if not set -q selected[1]; and test (count $kept) -eq (count $packages)
            continue
        end

        set -l temporary (command mktemp -- "$manifest.XXXXXX"); or return
        if string join \n -- $kept | LC_ALL=C command sort -u >"$temporary"
            and command mv -fT -- "$temporary" "$manifest"
            continue
        end
        command rm -f -- "$temporary"
        return 1
    end
end
