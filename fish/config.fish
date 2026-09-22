if status is-interactive
	stty -ixon
	starship init fish  | source
    # Commands to run in interactive sessions can go here
end


