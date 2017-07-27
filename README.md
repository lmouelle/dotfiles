# dotfiles
I believe in writing down and documentating everything, so although it is extremely unlikely here is my dotfiles/emacs
setup in case someone wants to use it. Or more likely, another college student like me wants to learn from examples.

NOTE: if you are actually another student/beginner don't write your git history like I did ~6 months ago it's terrible.
Look at the past month or two for examples, didn't know better or care at the time.

A very primitive set of dotfiles I use with gnu stow. Really just fish shell config and my emacs setup.
The makefile/gnu stow method can be buggy at times, I don't setup new environments often enough to catch all bugs.

It also assumes that I have gnu stow and other similar software installed via my package manager, likely dnf or pacman.
Also assumes that my distro uses systemd for service management, so it can set and start emacs daemon as a service. 

fish shell setup is simply, just the config file dropped in the right place. 
Only sets some variables and extends path, nothing fancy. Tends to change often though,
frequent additions and deletions for languages for unstable/simple toolchains like OCaml and Rust.

Emacs setup has more to it.
There is a directory to set an desktop icon file under local, the emacs.service for systemd to manage the daemon in
the background at startup, and there is the actual config.

The actual emacs config is under .emacs.d/. 
I have structured it so each file is a seperate package to add or load. 
This makes it easier to update without restarting, simple eval the buffer and reload the package.
It package requires it's own packages as needed, so if my python require needs ipdb integration or something
the appropriate ipdb packages are only in the setup-python.el file.

The init.el file is the entry point. It only handles downloading and loading packages.
I require my custom made packages in it.
Next is the always directory. That is for settings and tools that should always be on, 
regardless of language/toolkit I'm writing in the current buffer.

Then there is the snippets directory, only for yasnippet to load from

Under files are file specific hooks, for example CIDER/repl should only be loaded for clojure files,
so the hooks are specific to when emacs loads a .clj file.

The elisp packages I wrote are pretty intuitively named, easy enough to read I think, if crufty
from when I was less experienced. A few are worth mentioning.

packaging.el is loaded first, it contains information on what repostories to download from
and associated helper functions. Needs to be loaded first, all follows from it.

