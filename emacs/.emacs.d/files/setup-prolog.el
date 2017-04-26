(require 'packaging)
(require-package 'smartparens)

;; Overrides so .pl extension associates with prolog, not perl
(add-to-list 'auto-mode-alist '("\\.\\(pl\\|pro\\|lgt\\)" . prolog-mode))

;; Should allow extra goodies when I hook to SWI prolog
;; Suggestion taken from https://www.metalevel.at/pceprolog/
(setq prolog-system 'swi
      prolog-program-switches '((swi ("-G128M" "-T128M" "-L128M" "-O"))
                                (t nil))
      prolog-electric-if-then-else-flag t)

(provide 'setup-prolog)
