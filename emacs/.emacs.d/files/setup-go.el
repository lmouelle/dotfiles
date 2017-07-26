(require 'packaging)

(require-package 'company)
(require-package 'company-go)
(require-package 'flycheck)
(require-package 'go-eldoc)
(require-package 'go-mode)
(require-package 'go-guru)
(require-package 'smartparens)
(require-package 'exec-path-from-shell)

(add-hook 'go-mode-hook (lambda ()
			  (set (make-local-variable 'company-backends) '(company-go))
			  (company-mode)))
(add-hook 'go-mode-hook #'flycheck-mode)
;; GOPATH/bin needs to be set also
;; else we need to set the elisp go-eldoc-gocode variable
(add-hook 'go-mode-hook #'go-eldoc-setup)
(add-hook 'before-save-hook #'gofmt-before-save)
(add-hook 'go-mode-hook #'smartparens-mode)
(go-guru-hl-identifier-mode t)

;; Hax, for some reason even if GOPATH is set within config.fish
;; gocode isn't seen by eldoc-doc or company-go
;; This appears to do it though it's a trick usually only used on OSX
(exec-path-from-shell-initialize)
(exec-path-from-shell-copy-env "GOPATH")

(provide 'setup-go)
