;;; to run this I need to install OPAM
;;; then do the standard OPAM init
;;; then "opam install merlin", optionally utop, ocamlbuild and ocp-indent
;;; The merlin package in MELPA is a lie it seems...
;;; TODO this is kinda hacky and relies on some cp'd stuff. Clean it up


;; https://github.com/diml/utop
;; Look at the utop table there, cheat sheet here
;; C-c C-s	utop	Start a utop buffer
;; C-x C-e	utop-eval-phrase	Evaluate the current phrase
;; C-x C-r	utop-eval-region	Evaluate the selectoed region
;; C-c C-b	utop-eval-buffer	Evaluate the current buffer
;; C-c C-k	utop-kill	Kill a running utop process

(require 'packaging)
(require-package 'smartparens)
(require-package 'tuareg)
(require-package 'company)
(require-package 'utop) ;; TODO integrate utop more completely
(require-package 'ocp-indent)
(require-package 'merlin-company)
(require-package 'merlin)

(setq tuareg-match-patterns-aligned t)

(let ((opam-share (ignore-errors (car (process-lines "opam" "var" "share")))))
  (when (and opam-share (file-directory-p opam-share))
    (add-to-list 'load-path (expand-file-name "emacs/site-lisp" opam-share))
    (autoload 'merlin-mode "merlin" nil t nil)
    (setq merlin-command 'opam)))

(let ((opam-bin (ignore-errors (car (process-lines "opam" "var" "bin")))))
  (setq ocp-indent-path (expand-file-name "ocp-indent" opam-bin)))

(setq utop-command "opam config exec -- utop -emacs")

(add-hook 'merlin-mode-hook 'company-mode)
(add-hook 'tuareg-mode-hook 'smartparens-mode)
(add-hook 'tuareg-mode-hook 'merlin-mode t)
(add-hook 'tuareg-mode-hook 'utop-minor-mode)

(with-eval-after-load 'company
  (add-to-list 'company-backends 'merlin-company-backend))

(provide 'setup-ocaml)
