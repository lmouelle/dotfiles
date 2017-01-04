# Add rustup toolchain to path
set -gx PATH $PATH ~/.cargo/bin

# Give Emacs terminal an alias
alias emct "emacsclient -t"

# Emacs starts as a daemon due to a systemd service in
# ~/.config/systemd/user/emacs.service, this merely calls it
set -gx EDITOR "emacsclient -t"