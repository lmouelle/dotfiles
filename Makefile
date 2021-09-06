# This file contains a list of programs that are configured with this dotfile setup
# We use gnu make + gnu stow + git to get our dotfiles running
# Most of the concern and complexity comes from fish shell + emacs

.DEFAULT_GOAL:=install

CONFIGS=$(sort $(dir $(wildcard */)))
PACKAGES=opam stow fish patch
# For some reason patch is not being picked up as a dependency when opam is installed
OPAMPACKAGES=merlin ocp-ident

.PHONY: install
install: packages opampackages
	stow -t ~ $(CONFIGS)
	$(MAKE) emacs_install

.PHONY: uninstall
uninstall:
	$(MAKE) emacs_uninstall
	stow -Dt ~ $(CONFIGS)

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
	git pull
	$(MAKE) uninstall
	$(MAKE) install

.PHONY: packages
packages:
	sudo pacman -Syu $(PACKAGES) --needed

.PHONY: opampackages
opampackages:
	opam init --disable-shell-hook
	opam install merlin ocp-indent utop