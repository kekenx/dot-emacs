;;; my-which-key.el --- which-key configuration -*- lexical-binding: t; -*-
;;; Commentary:
;;; which-key shows available keybindings in a popup.  It is built into
;;; Emacs 30 and a MELPA package on 29; installing from MELPA works on both.
;;; Code:

(use-package which-key
  :ensure t
  :config
  (which-key-mode 1))

;;; my-which-key.el ends here
