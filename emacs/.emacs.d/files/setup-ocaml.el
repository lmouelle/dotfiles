(require 'packaging)
(require-package 'smartparens)
;; (require-package 'ocp-indent)
(require-package 'tuareg)
;; Merlin was installed with OPAM
;; (require-package 'company) ;; this is likely covered by merlin
;; TODO get automformat func, is it in ocp-indent?

(setq tuareg-match-patterns-aligned t)


(let ((opam-share (ignore-errors (car (process-lines "opam" "config" "var" "share")))))
  (when (and opam-share (file-directory-p opam-share))
    (add-to-list 'load-path (expand-file-name "emacs/site-lisp" opam-share))
    (autoload 'merlin-mode "merlin" nil t nil)
    (add-hook 'tuareg-mode-hook 'merlin-mode t)
    (setq merlin-command "ocamlmerlin")))

(add-hook 'tuareg-mode-hook 'smartparens-mode)

(provide 'setup-ocaml)))


(provide 'setup-ocaml)
