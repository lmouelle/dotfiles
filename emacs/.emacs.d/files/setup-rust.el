(require 'packaging)

(require-package 'company)
(require-package 'racer)
(require-package 'rust-mode)
(require-package 'flycheck)
(require-package 'flycheck-rust)
(require-package 'eldoc)
(require-package 'toml-mode)
(require-package 'cargo)
(require-package 'smartparens)

(add-hook 'rust-mode-hook #'racer-mode)
(add-hook 'rust-mode-hook #'cargo-minor-mode)
(add-hook 'rust-mode-hook #'smartparens-mode)

(add-hook 'racer-mode-hook #'company-mode)
(add-hook 'racer-mode-hook #'eldoc-mode)

(add-hook 'flycheck-mode-hook #'flycheck-rust-setup)
(add-hook 'racer-mode-hook #'flycheck-mode-hook)


(provide 'setup-rust)
