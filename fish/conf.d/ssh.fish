if status is-login; and status is-interactive

    #Check if keychain exists
    if type -q keychain

        #List of ssh we wanto to load
        #Add more keys if needed
        set -Ua SSH_KEYS_TO_AUTOLOAD ~/.ssh/id_ed25519

        #Load keychains
        keychain --quiet --eval $SSH_KEYS_TO_AUTOLOAD | source

    end

end
