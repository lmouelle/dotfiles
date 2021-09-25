# Give Emacs terminal an alias
alias emct "emacsclient -t"

# Emacs starts as a daemon due to a systemd service in
# ~/.config/systemd/user/emacs.service, this merely calls it
set -gx EDITOR "emacsclient -t"

# OPAM configuration
source /home/$USER/.opam/opam-init/init.fish > /dev/null 2> /dev/null; or true

# The $fish_greeting breaks certain applications like Winscp
# so zero it out to nothing
set fish_greeting

# Start ssh agent so we can list/manage keys, and output csh-style
# syntax for setting env variables that are friendly to fish
eval (ssh-agent -c)
