(require 'packaging)
(require 'ido)
(require-package 'ido-completing-read+)
(require-package 'smex)

(ido-mode 1)
(setq ido-enable-flex-matching t)
(setq ido-auto-merge-work-directories-length -1)

(ido-ubiquitous-mode 1)

(global-set-key (kbd "C-x C-b") 'ibuffer)

(setq smex-save-file (concat user-emacs-directory ".smex-items"))
(smex-initialize)
(global-set-key (kbd "M-x") 'smex)

(provide 'navigation)
