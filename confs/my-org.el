;;; my-org.el --- org-mode configuration -*- lexical-binding: t; -*-
;;; Commentary:
;;; org is built into Emacs, so :ensure nil.  (The old config used
;;; `(use-package org-mode ...)', but the package is named `org', not
;;; `org-mode' -- with :ensure that tried to install a non-existent package.)
;;; Code:

(use-package org
  :ensure nil
  :mode ("\\.org\\'" . org-mode)
  :init
  (setq org-todo-keywords
        '((sequence "TODO(t)" "SOMEDAY(s)" "WAITING(w)" "IN PROGRESS(i)" "|" "DONE(d)")))
  (setq org-enforce-todo-dependencies t)
  :config
  ;; Allow executing inline source blocks for these languages.
  (org-babel-do-load-languages
   'org-babel-load-languages
   '((python . t)
     (lua . t))))

;;; my-org.el ends here
