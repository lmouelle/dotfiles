(require 'packaging)

(require-package 'robe)
(require-package 'company)
(require-package 'flycheck)
(require-package 'smartparens)

(with-eval-after-load 'flycheck (flycheck-pos-tip-mode))

(eval-after-load 'company
  '(push 'company-robe company-backends))

(add-hook 'ruby-mode-hook 'smartparens-mode)
(add-hook 'ruby-mode-hook 'company-mode)
(add-hook 'ruby-mode-hook 'flycheck-mode)
(add-hook 'ruby-mode-hook 'robe-mode)

(provide 'setup-ruby)
