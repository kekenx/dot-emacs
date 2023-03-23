;;; my-web.el --- typescript support
;;; Code:

(use-package web-mode
  :ensure t
  :mode (("\\.[tj]sx?\\'" . web-mode))
  :config
  (setq web-mode-markup-indet-offset 2)
  (setq web-mode-css-indent-offset 2)
  (setq web-mode-code-indent-offset 2)
  )

(use-package lsp-mode
  :ensure t
  :commands (lsp lsp-deferred)
  :hook (web-mode . lsp-deferred)
  )

;;; my-web.el ends here~
