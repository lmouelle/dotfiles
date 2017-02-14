(require 'packaging)
;; (require-package 'ocp-indent)
(require-package 'tuareg)
;; (require-package 'company) ;; this is likely covered by merlin
;; TODO get automformat func, is it in ocp-indent?
;; 

(setq tuareg-match-patterns-aligned t)
;; (add-hook 'tuareg-mode-hook 'merlin-mode)
;; (add-to-list 'load-path (expand-file-name "~/.opam/system/share/emacs/site-lisp"))


(provide 'setup-ocaml)
