(require 'packaging)

(require-package 'cc-mode)
(require-package 'clang-format)
(require-package 'company)
(require-package 'smartparens)
(require-package 'flycheck)

(add-hook 'c-mode-hook #'smartparens-mode)
(add-hook 'c-mode-hook #'company-mode)
(add-hook 'c-mode-hook #'flycheck-mode)

(provide 'setup-c)
