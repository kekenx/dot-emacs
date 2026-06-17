;;; my-web.el --- web-mode (JSX/TSX) support -*- lexical-binding: t; -*-
;;; Commentary:
;;; web-mode handles JSX/TSX.  Plain .ts is left to typescript-mode
;;; (my-typescript.el) so the two no longer fight over `.ts'.
;;; lsp-mode itself is configured in my-lsp.el.
;;; Code:

(use-package web-mode
  :ensure t
  :mode ("\\.[jt]sx\\'" . web-mode)
  :hook (web-mode . lsp-deferred)
  :config
  (setq web-mode-attr-indent-offset nil)
  (setq web-mode-enable-auto-closing t)
  (setq web-mode-enable-auto-pairing t)
  (setq web-mode-auto-close-style 2)
  (setq web-mode-tag-auto-close-style 2)
  (setq web-mode-markup-indent-offset 2)
  (setq web-mode-css-indent-offset 2)
  (setq web-mode-code-indent-offset 2)
  (setq indent-tabs-mode nil))

;;; my-web.el ends here
