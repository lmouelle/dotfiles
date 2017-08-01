(require 'packaging)

(require-package 'swift-mode)
(require-package 'flycheck-swift)
(require-package 'flycheck)
(require-package 'smartparens)
;; There are packages in MELPA for swift,
;; some are titled *swift* and some are *swift3*
;; The swift3 ones appear to be designed to work with
;; the apple created swift-mode.el, as opposed to the community one
;; the apple made one is not in the repos yet so even though
;; I generally prefer the corpoerate backed tech I'll avoid it
;; for now
;; (require-package 'flycheck-swift3)

(with-eval-after-load 'flycheck
  (flycheck-swift-setup))

(provide 'setup-swift)
