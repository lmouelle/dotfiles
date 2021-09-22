# This file contains a list of programs that are configured with this dotfile setup
# We use gnu make + gnu stow + git to get our dotfiles running
# Most of the concern and complexity comes from fish shell + emacs

.DEFAULT_GOAL:=install

CONFIGS=$(sort $(dir $(wildcard */)))
# Packages are software that we have configurations for in this dotfiles
# repository
PACKAGES=opam stow fish patch
# For some reason patch is not being picked up as a dependency when opam is installed,
# notified arch package maintainer but it can take time for that pickup.
# For now explicitly marking patch as required

# Packages to be installed via opam instead of distro installer
# are opam packages
OPAMPACKAGES=merlin ocp-indent utop

## Misc software, mostly GUI applications

# What IRC client to use? Been using hexchat mainly for stupid simple xdcc,
# maybe learn weechat?
APPS=mpv mcomix desmume virt-manager emacs
# Software that is not in main repos in arch linux, instead in
# AUR only. TODO: Find way to make these lists all cross-compat with
# fedora...
AUR=brave-bin bitwarden joplin citra-qt-git zoom-system-qt obmenu-generator

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
	systemctl --user condstart emacs

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
	sudo pacman -Sy $(PACKAGES) --needed

.PHONY: opampackages
opampackages: packages
	# Disable shell hook because we explicitly set the config
	# for fish-utop integration in this git repository under config.fish
	opam init --disable-shell-hook
	opam install $(OPAMPACKAGES)
