(require 'packaging)

(require-package 'cc-mode)
(require-package 'clang-format)
(require-package 'company)
(require-package 'smartparens)
(require-package 'smartparens-config) ; sets defaults
(require-package 'flycheck)
(require-package 'flycheck-pos-tip)
(require-package 'yasnippet)

(add-hook 'c-mode-hook #'smartparens-mode)
(add-hook 'c-mode-hook #'company-mode)
(add-hook 'c-mode-hook #'flycheck-mode)
(with-eval-after-load 'flycheck (flycheck-pos-tip-mode))

;; Clang format functions should be auto called as needed

(provide 'setup-c)
