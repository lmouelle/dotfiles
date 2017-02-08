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
