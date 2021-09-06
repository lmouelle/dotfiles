(require 'packaging)

(require-package 'golden-ratio)
(require-package 'darcula-theme)

(setq inhibit-startup-message t)

;; Disable scroll and tool bars
;; But not menu bar I use it to learn new modes
(when (fboundp 'scroll-bar-mode)
  (scroll-bar-mode -1))
(when (fboundp 'tool-bar-mode)
  (tool-bar-mode -1))

(setq
 x-select-enable-clipboard t
 x-select-enable-primary t
 save-interprogram-paste-before-kill t)

(setq column-number-mode t)

(add-hook 'prog-mode-hook #'linum-mode)

(load-theme 'darcula t)

(global-set-key (kbd "C-z") nil)

(provide 'ui)
