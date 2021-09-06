(require 'packaging)
(require-package 'smartparens)
(require-package 'flymake)

;; Overrides so .pl extension associates with prolog, not perl
(add-to-list 'auto-mode-alist '("\\.\\(pl\\|pro\\|lgt\\)" . prolog-mode))


(defun flymake-prolog-init ()
  (let* ((temp-file   (flymake-init-create-temp-buffer-copy
                       'flymake-create-temp-inplace))
         (local-file  (file-relative-name
                       temp-file
                       (file-name-directory buffer-file-name))))
    (list "swipl" (list "-q" "-t" "halt" "-s " local-file))))

(defun setup-prolog-misc ()
  "Various things to do added for hooking to prolog,
   cribbed from https://www.metalevel.at/pceprolog/"
  (make-local-variable 'flymake-allowed-file-name-masks)
  (make-local-variable 'flymake-err-line-patterns)
  (setq flymake-err-line-patterns
	'(("ERROR: (?\\(.*?\\):\\([0-9]+\\)" 1 2)
	  ("Warning: (\\(.*\\):\\([0-9]+\\)" 1 2)))
  (setq flymake-allowed-file-name-masks
	'(("\\.pl\\'" flymake-prolog-init)))
  (flymake-mode t))

;; Should allow extra goodies when I hook to SWI prolog
;; Suggestion taken from https://www.metalevel.at/pceprolog/
(setq prolog-system 'swi
      prolog-program-switches '((swi ("-G128M" "-T128M" "-L128M" "-O"))
                                (t nil))
      prolog-electric-if-then-else-flag t)

(add-hook 'prolog-mode-hook 'smartparens-mode)
(add-hook 'prolog-mode-hook 'setup-prolog-misc)

(provide 'setup-prolog)
