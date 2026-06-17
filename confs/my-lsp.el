;;; my-lsp.el --- shared lsp-mode configuration -*- lexical-binding: t; -*-
;;; Commentary:
;;; Single place that configures lsp-mode + lsp-ui.  Language files
;;; (my-rust.el, my-web.el, my-typescript.el, ...) only attach their own
;;; `lsp' / `lsp-deferred' hooks; they do not re-declare lsp-mode.
;;;
;;; This file is loaded before the language files (alphabetical order in
;;; confs/), and the `lsp'/`lsp-deferred' autoloads it defines make those
;;; hooks work even though lsp-mode itself is loaded lazily.

;;; Code:

(use-package lsp-mode
  :ensure t
  :commands (lsp lsp-deferred)
  :init
  (setq lsp-keymap-prefix "C-c C-l")
  ;; We don't use yasnippet, so disable snippet expansion in completions.
  ;; (The old config called `yas-global-mode' here while yasnippet was
  ;; uninstalled, which errored and aborted LSP startup -- breaking M-.)
  (setq lsp-enable-snippet nil)
  :bind ("C-c h" . lsp-describe-thing-at-point)
  :custom
  (lsp-rust-server 'rust-analyzer))

(use-package lsp-ui
  :ensure t
  :commands lsp-ui-mode)

;;; my-lsp.el ends here
