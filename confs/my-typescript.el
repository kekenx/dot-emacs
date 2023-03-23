;;; my-typescript.el --- typescript support
;;; Code:

(use-package typescript-mode
  :ensure t
  :mode (("\\.ts\\'" . typescript-mode))
  :config
  (setq typescript-indent-level2))

(use-package lsp-mode
  :ensure t
  :commands (lsp lsp-deferred)
  :hook (typescript-mode . lsp-deferred)
  )

;;; my-typescript.el ends here~
