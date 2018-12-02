# Add rustup toolchain to path
set -gx PATH $PATH ~/.cargo/bin
set -gx RUST_SRC_PATH ~/.rustup/toolchains/stable-x86_64-unknown-linux-gnu/lib/rustlib/src/rust/src

# Give Emacs terminal an alias
alias emct "emacsclient -t"

# Emacs starts as a daemon due to a systemd service in
# ~/.config/systemd/user/emacs.service, this merely calls it
set -gx EDITOR "emacsclient -t"

# OPAM configuration
source /home/$USER/.opam/opam-init/init.fish > /dev/null 2> /dev/null; or true

# Add snap to path
set -gx PATH $PATH /snap/bin
