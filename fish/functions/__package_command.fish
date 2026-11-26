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
    set -l destination
    set -l explicit_before

    if test "$action" != remove
        set explicit_before (command pacman -Qqe); or return
    end

    switch "$action"
        case install
            command sudo pacman -Syu -- $argv; or return
            set destination "$pacman_list"
        case install-yay
            command yay -- $argv; or return
            set destination "$yay_list"
        case remove
            command sudo pacman -Runs -- $argv; or return
    end

    set -l installed (command pacman -Qq); or return
    set -l selected
    if set -q destination[1]
        set -l explicit_after (command pacman -Qqe); or return
        set -l candidates
        if test "$action" = install
            set -l targets (string replace -r '^[^/]+/' '' -- $argv)
            set selected (command pacman -Qq -- $targets 2>/dev/null)
            # Only add group members that became explicit during this install.
            set candidates (command pacman -Qqg -- $targets 2>/dev/null)
        else
            # Yay arguments are search terms, so track what the user selected.
            set candidates $installed
        end

        for package in $explicit_after
            if contains -- "$package" $candidates; and not contains -- "$package" $explicit_before
                set -a selected "$package"
            end
        end
    end

    for manifest in "$pacman_list" "$yay_list"
        set -l packages
        if test -e "$manifest"
            set packages (command cat -- "$manifest"); or return
        end
        if contains -- "$manifest" $destination
            set -a packages $selected
        end

        set -l kept
        for package in $packages
            if contains -- "$package" $installed
                set -a kept "$package"
            end
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
