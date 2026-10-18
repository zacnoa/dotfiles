if status is-interactive
	stty -ixon
	starship init fish  | source
    # Commands to run in interactive sessions can go here
end



### MANAGED BY RANCHER DESKTOP START (DO NOT EDIT)
set --export --prepend PATH "/home/zacnoa/.rd/bin"
### MANAGED BY RANCHER DESKTOP END (DO NOT EDIT)
