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

;; Load packages from the files specific group
(require 'setup-c)
(require 'setup-elisp)
(require 'setup-python)
(require 'setup-clojure)
(require 'setup-rust)
(require 'setup-ruby)

(provide 'init)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   (quote
    ("fad38808e844f1423c68a1888db75adf6586390f5295a03823fa1f4959046f81" default)))
 '(package-selected-packages
   (quote
    (darcula-theme chruby robe ruby-electric inf-ruby cargo toml-mode flycheck-rust racer cider-eval-sexp-fu cider yasnippet smex smartparens rainbow-delimiters python-mode popwin paredit live-py-mode ido-ubiquitous golden-ratio flycheck-pos-tip dracula-theme company-anaconda clang-format auto-compile))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
