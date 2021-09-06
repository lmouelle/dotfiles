(require 'packaging)

;; Features I want:
;; Basic autocompletion of words
;; smartparens balancing for standard delimiters like parens and brackets
;; Also balancing for dollar signs
;; Snippets for completing \begin{foo}...\end{foo} blocks.

;; Most important is live editing; I want a repl like environment
;; That means I want the PDF in another buffer, constatnly reloading every
;; time I compile. I want it to be fast too!

;; Auctex does most, if not all of that. I just need to read the docs.
;; Most important, C-c C-p C-s renders section/subsection in buffer
;; With it I do not need to keep a second window open for doc-view on the PDF.
;; Much better, really feels like I'm working with CIDER/Slime for Clojure/CL

(require-package 'flycheck)
(require-package 'smartparens)
(require-package 'company)
(require-package 'auctex)
(require-package 'company-auctex)

(add-hook 'TeX-mode-hook #'smartparens-mode)
(add-hook 'TeX-mode-hook #'flycheck-mode)
(add-hook 'TeX-mode-hook #'company-mode)
(add-hook 'doc-view-minor-mode-hook #'auto-revert-mode)

(add-hook 'TeX-mode-hook (lambda ()
			     (progn
			       (setq TeX-PDF-mode t) ; PDF instead of DVI
			       (setq TeX-parse-self t)
			       (setq TeX-auto-save t)
			       (company-auctex-init))))

(provide 'setup-latex)
