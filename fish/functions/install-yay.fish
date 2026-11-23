function install-yay
    set -q argv[1]; or return 2
    command yay -- $argv; or return
    command pacman -Qqem >"$HOME/.config/packages-user.txt"
end
