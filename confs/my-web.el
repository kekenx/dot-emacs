;;; my-web.el --- typescript support
;;; Code:

(use-package web-mode
  :ensure t
  :mode (("\\.[tj]sx?\\'" . web-mode))
  :config
  (setq web-mode-attr-indent-offset nil)
  (setq web-mode-enable-auto-closing t)
  (setq web-mode-enable-auto-pairing t)
  (setq web-mode-auto-close-style 2)
  (setq web-mode-tag-auto-close-style 2)
  (setq web-mode-markup-indent-offset 2)
  (setq web-mode-css-indent-offset 2)
  (setq web-mode-code-indent-offset 2)
  (setq indent-tabs-mode nil)
  (setq tab-width 2)
  )

(use-package lsp-mode
  :ensure t
  :commands (lsp lsp-deferred)
  :hook (web-mode . lsp-deferred)
  )

;;; my-web.el ends here~
