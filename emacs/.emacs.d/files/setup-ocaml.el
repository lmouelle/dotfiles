;;; to run this I need to install OPAM
;;; then do the standard OPAM init
;;; then "opam install merlin", optionally utop, ocamlbuild and ocp-indent
;;; The merlin package in MELPA is a lie it seems...
;;; TODO this is kinda hacky and relies on some cp'd stuff. Clean it up


(require 'packaging)
(require-package 'smartparens)
;; (require-package 'ocp-indent)
(require-package 'tuareg)
(require-package 'company) ;; this is likely covered by merlin
;; TODO get automformat func, is it in ocp-indent?;;
(require-package 'utop) ;; TODO integrate utop more completely

(setq tuareg-match-patterns-aligned t)

(let ((opam-share (ignore-errors (car (process-lines "opam" "config" "var" "share")))))
  (when (and opam-share (file-directory-p opam-share))
    (add-to-list 'load-path (expand-file-name "emacs/site-lisp" opam-share))
    (autoload 'merlin-mode "merlin" nil t nil)
    (add-hook 'tuareg-mode-hook 'merlin-mode t)
    (with-eval-after-load 'company
      (add-to-list 'company-backends 'merlin-company-backend))
    (add-hook 'merlin-mode-hook 'company-mode)
    (setq merlin-command 'opam)))

(add-hook 'merlin-mode-hook 'company-mode)
(add-hook 'tuareg-mode-hook 'smartparens-mode)
(add-hook 'tuareg-mode-hook 'merlin-mode t)

(with-eval-after-load 'company
  (add-to-list 'company-backends 'merlin-company-backend))

(provide 'setup-ocaml)
