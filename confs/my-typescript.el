;;; my-typescript.el --- TypeScript support -*- lexical-binding: t; -*-
;;; Commentary:
;;; Plain .ts files use typescript-mode.  JSX/TSX files use web-mode
;;; (see my-web.el).  lsp-mode itself is configured in my-lsp.el.
;;; Code:

(use-package typescript-mode
  :ensure t
  :mode ("\\.ts\\'" . typescript-mode)
  :hook (typescript-mode . lsp-deferred)
  :config
  (setq typescript-indent-level 2))

;;; my-typescript.el ends here
