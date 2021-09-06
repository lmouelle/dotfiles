(require 'packaging)

(require-package 'paredit)

(require-package 'cider)

(require-package 'rainbow-delimiters)

(require-package 'cider-eval-sexp-fu)

(add-hook 'clojure-mode-hook #'paredit-mode)
(add-hook 'clojure-mode-hook #'subword-mode)
(add-hook 'clojure-mode-hook #'rainbow-delimiters-mode)
(add-hook 'clojure-mode-hook #'turn-on-eldoc-mode)

(add-hook 'clojure-mode-hook
          (lambda ()
            (setq inferior-lisp-program "lein repl")
            (font-lock-add-keywords
             nil
             '(("(\\(facts?\\)"
                (1 font-lock-keyword-face))
               ("(\\(background?\\)"
                (1 font-lock-keyword-face))))
            (define-clojure-indent (fact 1))
            (define-clojure-indent (facts 1))))


(setq cider-show-error-buffer t)
(setq cider-auto-select-error-buffer t)
(setq cider-repl-pop-to-buffer-on-connect t)

(add-hook 'cider-repl-mode-hook #'paredit-mode)
(add-hook 'cider-repl-mode-hook #'company-mode)
(add-hook 'cider-repl-mode-hook #'rainbow-delimiters-mode)

(add-hook 'cider-mode-hook #'company-mode)


(provide 'setup-clojure)
