;;; my-multiple-cursors.el --- multiple-cursors configuration
;;; Commentary:
;;; ...

;;; Code:
(ensure-package-installed 'multiple-cursors)

(require 'multiple-cursors)
(global-set-key (kbd "C-c m c") 'mc/edit-lines)
(global-set-key (kbd "C-o") 'mc/mark-next-like-this)
(global-set-key (kbd "C-u") 'mc/mark-previous-like-this)
(global-set-key (kbd "C-c C-i") 'mc/mark-all-like-this)

;;; my-multiple-cursors.el ends here
