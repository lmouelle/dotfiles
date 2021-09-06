;;;; Packing info in this file 

(require 'package)
(defun require-package (package)
  "Install package from repo if not installed and require it"
  (if (package-installed-p package)
      t
    (progn
      (package-refresh-contents)
      (package-install package)
      (require package))))


(add-to-list 'package-archives
             '("melpa" . "https://melpa.org/packages/") t)

(package-initialize)

(provide 'packaging)
