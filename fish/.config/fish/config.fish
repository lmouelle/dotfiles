# Add rustup toolchain to path
set -gx PATH $PATH ~/.cargo/bin
set -gx RUST_SRC_PATH ~/.rustup/toolchains/stable-x86_64-unknown-linux-gnu/lib/rustlib/src/rust/src

# Give Emacs terminal an alias
alias emct "emacsclient -t"

# Emacs starts as a daemon due to a systemd service in
# ~/.config/systemd/user/emacs.service, this merely calls it
set -gx EDITOR "emacsclient -t"

# Setting GOPATH manually, don't like default of $HOME/go
# Might be a bad idea but I'll also add it to path, so if I do 'go get ...gocode'
# it's easily accessible by emacs and other programs that can resolve from shell
set -gx GOPATH $HOME/Code/golang
set -gx PATH $PATH $GOPATH/bin

# OPAM configuration
source /home/lu/.opam/opam-init/init.fish > /dev/null 2> /dev/null; or true
set -gx VAGRANT_DEFAULT_PROVIDER virtualbox
