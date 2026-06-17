;;; my-rust.el --- Rust configuration -*- lexical-binding: t; -*-
;;; Commentary:
;;; Rust setup.  lsp-mode itself is configured in my-lsp.el; here we only
;;; enable rust-mode + cargo and attach the `lsp' hook so rust-analyzer
;;; provides completion and jump-to-definition (M-.).
;;; reference: https://keens.github.io/blog/2020/12/01/rustnokankyoukouchiku_emacs_/

;;; Code:

(add-to-list 'exec-path (expand-file-name "~/tools"))
(add-to-list 'exec-path (expand-file-name "~/.cargo/bin"))

(use-package rust-mode
  :ensure t
  :hook (rust-mode . lsp)
  :custom
  (rust-format-on-save t)
  :config
  (add-hook 'rust-mode-hook (lambda () (setq indent-tabs-mode nil))))

(use-package cargo
  :ensure t
  :hook (rust-mode . cargo-minor-mode)
  :bind (:map rust-mode-map
              ("C-c C-c C-p" . cargo-process-clippy))
  :config
  (setq cargo-process--command-clippy "clippy")
  (setq cargo-process--command-flags "--color never"))

;;; my-rust.el ends here
