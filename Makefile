# This file contains a list of programs that are configured with this dotfile setup
# We use gnu make + gnu stow + git to get our dotfiles running
# Most of the concern and complexity comes from fish shell + emacs

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
