;;; my-undo-tree.el --- undo-tree configuration
;;; Commentary: ...
;;; undo-tree configuration --- ...

;;; Code:
(use-package undo-tree
  :ensure t
  :init
  (global-undo-tree-mode)
  (setq undo-tree-auto-save-history nil)
  )
;;; my-undo-tree.el ends here
