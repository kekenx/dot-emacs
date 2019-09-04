;;; my-jsx.el --- python configuration
;;; Commentary:
;;; python configuration --- ...

;;; Code:
(ensure-package-installed 'rjsx-mode)

(add-to-list 'auto-mode-alist '(".*\\.js\\'" . rjsx-mode))

;;; my-jsx.el ends here
