function remove
    set -q argv[1]; or return 2
    command sudo pacman -Runs -- $argv; or return
    command pacman -Qqen >"$HOME/.config/packages.txt"
    command pacman -Qqem >"$HOME/.config/packages-user.txt"
end
