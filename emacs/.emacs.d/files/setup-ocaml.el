;; TODO this is kinda hacky and relies on some cp'd stuff. Clean it up

(require 'packaging)
(require-package 'smartparens)
;; (require-package 'ocp-indent)
(require-package 'tuareg)
;; Merlin was installed with OPAM
(require-package 'company)
;; TODO get automformat func, is it in ocp-indent?;;
(require-package 'utop)

(setq tuareg-match-patterns-aligned t)

(let ((opam-share (ignore-errors (car (process-lines "opam" "config" "var" "share")))))
  (when (and opam-share (file-directory-p opam-share))
    (add-to-list 'load-path (expand-file-name "emacs/site-lisp" opam-share))
    (autoload 'merlin-mode "merlin" nil t nil)
    (add-hook 'tuareg-mode-hook 'merlin-mode t)))

(with-eval-after-load 'company
  (add-to-list 'company-backends 'merlin-company-backend))

(add-hook 'tuareg-mode-hook 'smartparens-mode)

(add-hook 'merlin-mode-hook 'company-mode)

(provide 'setup-ocaml)
