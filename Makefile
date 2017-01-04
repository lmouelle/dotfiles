# ; This file contains a list of programs that are configured with this dotfile setup
# ; We use gnu make + gnu stow + git to get our dotfiles running
# fish ; also the agnoster theme with fish shell
# oh-my-fish
# emacs
# rust with the rustup tool
#
# General install will install the generic packages, but does not complete the entire setup
# Package specific installs, e.g. emacs_install, will operate for specific pkg logic
# finally there is simply install and uninstall, which is the completion, last steps
#

# Right now we can use rustup to download the rust source.
# The issue is that it downloads to a weird location.
# I would rather it download to somewhere in my dotfiles and let symlinks do magic
# That was it is easier to set the RUST_SRC_PATH

.DEFAULT_GOAL:=install

PACKAGES=$(sort $(dir $(wildcard */)))

.PHONY: rust_uninstall
rust_uninstall:
	rustup self uninstall
	rm ~/.config/fish/completions/rustup.fish
	rmdir -p ~/.config/fish/completions
	# this removal does leave one thing: the rust binaries in
	# ~/.cargo/bin. They can take a loooong time to compile,
	# and since I often troubleshoot by reinstalling with this makefile
	# I will let this set between installations FOR NOW.

.PHONY: rust_install
rust_install:
	curl https://sh.rustup.rs -sSf | sh
	mkdir -p ~/.config/fish/completions/
	rustup completions fish > ~/.config/fish/completions/rustup.fish
	cargo install racer
	cargo install rustfmt
	rustup component add rust-src

.PHONY: install
install: 
	stow -t ~ $(PACKAGES)
	$(MAKE) emacs_install

.PHONY: uninstall
uninstall: 
	$(MAKE) emacs_uninstall
	stow -Dt ~ $(PACKAGES)

.PHONY: emacs_install
emacs_install:
	systemctl --user enable emacs
	systemctl --user start emacs

.PHONY: emacs_uninstall
emacs_uninstall:
	systemctl --user condstop emacs
	systemctl --user disable emacs

.PHONY: reinstall
reinstall:
	$(MAKE) uninstall
	$(MAKE) install

.PHONY: update
update: 
	$(MAKE) uninstall
	git pull
	$(MAKE) install
