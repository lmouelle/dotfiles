(require 'packaging)

(require-package 'auto-compile)
(require-package 'company)
(require-package 'paredit)
(require-package 'rainbow-delimiters)

(add-hook 'emacs-lisp-mode-hook #'company-mode)

(add-hook 'emacs-lisp-mode-hook #'paredit-mode)
(add-hook 'eval-expression-minibuffer-setup-hook #'paredit-mode)
(add-hook 'lisp-interaction-mode-hook #'paredit-mode)
(add-hook 'lisp-mode-hook #'enable-paredit-mode)

(add-hook 'emacs-lisp-mode-hook #'turn-on-eldoc-mode)
(add-hook 'lisp-interaction-mode-hook #'turn-on-eldoc-mode)

;; This mode does not show in the mode list bar, don't be surprised!
(add-hook 'emacs-lisp-mode-hook #'rainbow-delimiters-mode)
(add-hook 'lisp-mode-hook #'rainbow-delimiters-mode)

(provide 'setup-elisp)
