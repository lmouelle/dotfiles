(require 'packaging)

(require-package 'cc-mode)
(require 'cc-mode)

(require-package 'clang-format)
(require 'clang-format)

(require-package 'company)
(require 'company)

(require-package 'smartparens)
(require 'smartparens)
(require 'smartparens-config) ; sets defaults

(require-package 'flycheck)
(require 'flycheck)

(require-package 'flycheck-pos-tip)
(require 'flycheck-pos-tip)

(require-package 'yasnippet)
(require 'yasnippet)

(add-hook 'c-mode-hook #'smartparens-mode)
(add-hook 'c-mode-hook #'company-mode)
(add-hook 'c-mode-hook #'flycheck-mode)
(with-eval-after-load 'flycheck (flycheck-pos-tip-mode))


(global-set-key (kbd "C-c C-c") 'clang-format-buffer)

;; Clang format functions should be auto called as needed

;; TODO check that this does not delete other lang's backends...
(setq company-backends (delete 'company-semantic company-backends))

(provide 'setup-c)
