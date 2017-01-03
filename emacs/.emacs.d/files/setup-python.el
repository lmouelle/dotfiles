(require 'packaging)

(require-package 'python-mode)
(require 'python-mode)

(require-package 'anaconda-mode)
(require 'anaconda-mode)

(require-package 'company-anaconda)
(require 'company-anaconda)

(require-package 'smartparens)
(require 'smartparens)
(require 'smartparens-config)

(require-package 'flycheck)
(require 'flycheck)

(require-package 'flycheck-pos-tip)
(require 'flycheck-pos-tip)

(require-package 'yasnippet)
(require 'yasnippet)

(require-package 'live-py-mode)
(require 'live-py-mode)

(add-hook 'python-mode-hook #'smartparens-mode)
(add-hook 'python-mode-hook #'anaconda-mode)
(add-hook 'python-mode-hook #'anaconda-eldoc-mode)
(add-hook 'python-mode-hook #'company-mode)

(eval-after-load "company"
  '(add-to-list 'company-backends '(company-anaconda :with company-capf)))

(when (executable-find "ipython3")
  (setq python-shell-interpreter "ipython3"))

(provide 'setup-python)
