;; This package contains general editing for all langs and stuff

;; Code

(require 'packaging)
(require-package 'yasnippet-snippets)


;; Please leave this at the top, things get strange if you do not
(setq custom-file "~/.emacs.d/.emacs_custom.el")
(load custom-file 'noerror)

(require-package 'yasnippet)
(require-package 'eldoc)

(yas-global-mode t)

(show-paren-mode t)
(define-key global-map (kbd "RET") 'newline-and-indent)

(defun toggle-comment-region-or-line ()
    "Comments or uncomments the region or the current line if there's no active region."
    (interactive)
    (let (beg end)
        (if (region-active-p)
            (setq beg (region-beginning) end (region-end))
            (setq beg (line-beginning-position) end (line-end-position)))
        (comment-or-uncomment-region beg end)))

(global-set-key (kbd "C-;") 'toggle-comment-region-or-line)

(yas-reload-all)
(add-hook 'prog-mode-hook #'yas-minor-mode)

(fset 'yes-or-no-p 'y-or-n-p)

(setq create-lockfiles nil)

(setq backup-directory-alist `(("." . "~/.emacs_backups"))) ;; Moves all the foo~ files to a special backup dir

(add-hook 'before-save-hook 'delete-trailing-whitespace)

(provide 'editing)
;;;

