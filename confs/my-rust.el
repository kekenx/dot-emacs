;;; my-rust.el --- rust configuration
;;; Commentary: reference https://keens.github.io/blog/2020/12/01/rustnokankyoukouchiku_emacs_/
;;; rust configuration --- ...

;;; Code:
(add-to-list 'exec-path (expand-file-name "~/tools"))
(add-to-list 'exec-path (expand-file-name "~/.cargo/bin"))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; #rust

(use-package rust-mode
  :ensure t
  :custom rust-format-on-save t)


(use-package cargo
  :ensure t
  :hook (rust-mode . cargo-minor-mode))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; #lsp

(use-package lsp-mode
  :init (setq lsp-keymap-prefix "C-c C-l")
  :ensure t
  :init (yas-global-mode)
  :hook (rust-mode . lsp)
  :bind ("C-c h" . lsp-describe-thing-at-point)
  :custom (lsp-rust-server 'rust-analyzer))
(use-package lsp-ui
  :ensure t)

;; my-rust.el ends here
