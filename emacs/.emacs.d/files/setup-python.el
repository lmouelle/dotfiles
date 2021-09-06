(require 'packaging)

(require-package 'python-mode)
(require-package 'anaconda-mode)
(require-package 'company-anaconda)
(require-package 'smartparens)
(require-package 'flycheck)
(require-package 'live-py-mode)

(add-hook 'python-mode-hook #'smartparens-mode)
(add-hook 'python-mode-hook #'anaconda-mode)
(add-hook 'python-mode-hook #'anaconda-eldoc-mode)
(add-hook 'python-mode-hook #'company-mode)
(add-hook 'python-mode-hook #'flycheck-mode)

(eval-after-load "company"
  '(add-to-list 'company-backends '(company-anaconda :with company-capf)))

(provide 'setup-python)
