;;; my-org.el --- org-mode configuration
;;; Commentary:
;;; org-mode configuration --- ...

;;; Code:

(use-package org-mode
  :mode ("\\.org\\'")
  :init
  (setq org-todo-keywords
	'((sequence "TODO(t)" "SOMEDAY(s)" "WAITING(w)" "IN PROGRESS(i)" "|" "DONE(d)")))
  (setq org-enforce-todo-dependencies t)
  ;;; for executing inline code.
  (org-babel-do-load-languages
   'org-babel-load-languages
   '((python . t))))

;;; my-org.el ends here
