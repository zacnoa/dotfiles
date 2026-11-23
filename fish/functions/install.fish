function install
    set -q argv[1]; or return 2
    command sudo pacman -Syu -- $argv; or return
    command pacman -Qqen >"$HOME/.config/packages.txt"
end
