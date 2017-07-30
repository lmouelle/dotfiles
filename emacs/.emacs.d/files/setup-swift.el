(require 'packaging)

(require-package 'swift-mode)
(require-package 'flycheck-swift)
(require-package 'flycheck)
(require-package 'smartparens)

(with-eval-after-load 'flycheck
  (flycheck-swift-setup))

(provide 'setup-swift)
