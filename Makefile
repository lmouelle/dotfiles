# ; This file contains a list of programs that are configured with this dotfile setup
# ; We use gnu make + gnu stow + git to get our dotfiles running
# fish ; also the agnoster theme with fish shell
# oh-my-fish
# emacs
#
# General install will install the generic packages, but does not complete the entire setup
# Package specific installs, e.g. emacs_install, will operate for specific pkg logic
# finally there is simply install and uninstall, which is the completion, last steps
#

.DEFAULT_GOAL:=install

PACKAGES=$(sort $(dir $(wildcard */)))

.PHONY: install
install: 
	stow -t ~ $(PACKAGES)

.PHONY: uninstall
uninstall: 
	systemctl --user condstop emacs
	systemctl --user disable emacs
	stow -Dt ~ $(PACKAGES)

.PHONY: redo
redo:
	$(MAKE) uninstall
	$(MAKE) install

.PHONY: update
update: 
	$(MAKE) uninstall
	git pull
	$(MAKE) install
