;;; my-org.el --- org-mode configuration
;;; Commentary:
;;; org-mode configuration --- ...

;;; Code:

(use-package org-mode
  :mode ("\\.org\\'")
  :init
  (setq org-todo-keywords
	'((sequence "TODO" "SOMEDAY" "WAITING" "DOING" "|" "DONE"))))

;;; my-org.el ends here
