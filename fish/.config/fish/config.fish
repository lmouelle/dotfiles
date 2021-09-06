# Give Emacs terminal an alias
alias emct "emacsclient -t"

# Emacs starts as a daemon due to a systemd service in
# ~/.config/systemd/user/emacs.service, this merely calls it
set -gx EDITOR "emacsclient -t"

# OPAM configuration
source /home/$USER/.opam/opam-init/init.fish > /dev/null 2> /dev/null; or true
