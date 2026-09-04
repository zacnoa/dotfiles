# Samo za login + interaktivne sesije
if status is-login; and status is-interactive

    # Provjeri da keychain postoji
    if type -q keychain

        # Lista ključeva koje želimo automatski učitati
        # Dodaj više ključeva po potrebi, npr. ~/.ssh/id_ed25519 ~/.ssh/id_rsa
        set -Ua SSH_KEYS_TO_AUTOLOAD ~/.ssh/id_ed25519

        # Pokreni keychain za te ključeve, quiet mode da ne spam-a terminal
        keychain --quiet --eval $SSH_KEYS_TO_AUTOLOAD | source

    end

end
