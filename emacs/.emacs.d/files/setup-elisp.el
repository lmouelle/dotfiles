(require 'packaging)

(require-package 'auto-compile)
(require 'auto-compile)

(require-package 'company)
(require 'company)

(require-package 'paredit)
(require 'paredit)

(require-package 'rainbow-delimiters)
(require 'rainbow-delimiters)

(add-hook 'emacs-lisp-mode-hook #'company-mode)

(add-hook 'emacs-lisp-mode-hook #'enable-paredit-mode)
(add-hook 'eval-expression-minibuffer-setup-hook #'enable-paredit-mode)
(add-hook 'lisp-interaction-mode-hook #'enable-paredit-mode)
(add-hook 'lisp-mode-hook #'enable-paredit-mode)

(add-hook 'emacs-lisp-mode-hook #'turn-on-eldoc-mode)
(add-hook 'lisp-interaction-mode-hook #'turn-on-eldoc-mode)

(add-hook 'emacs-lisp-mode-hook #'rainbow-delimiters-mode)
(add-hook 'lisp-mode-hook #'rainbow-delimiters-mode)

(provide 'setup-elisp)

