;;;; We'll keep only package handling and file loading in this file


;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)

(add-to-list 'load-path (expand-file-name "files" user-emacs-directory))
(add-to-list 'load-path (expand-file-name "always" user-emacs-directory))

;; Load packages from the always on group
(require 'packaging)
(require 'editing)
(require 'ui)
(require 'navigation)
(require 'vcs)

;; Load packages from the files specific group
(require 'setup-elisp)
(require 'setup-c)
(require 'setup-python)
(require 'setup-clojure)
(require 'setup-ocaml)
(require 'setup-latex)

(provide 'init)
