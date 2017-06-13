(require 'packaging)

(require-package 'cc-mode)
(require-package 'clang-format)
(require-package 'company)
(require-package 'smartparens)

(require-package 'flycheck)
(require-package 'yasnippet)

(add-hook 'c-mode-hook #'smartparens-mode)
(add-hook 'c-mode-hook #'company-mode)
(add-hook 'c-mode-hook #'flycheck-mode)

(global-set-key (kbd "C-c C-c") 'clang-format-buffer)

;; Clang format functions should be auto called as needed

(provide 'setup-c)
