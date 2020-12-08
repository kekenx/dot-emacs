;;; my-rust.el --- rust configuration
;;; Commentary:
;;; python configuration --- ...

;;; Code:
(ensure-package-installed 'rust-mode 'flycheck-rust 'company)

;; (use-package rust-mode)
;; (add-to-list 'exec-path(expand-file-name "~/.cargo/bin/"))
;; (add-to-list 'auto-mode-alist '("\\.rs\\'"  . rust-mode))
;; (add-hook 'rust-mode-hook #'racer-mode)
;; (add-hook 'racer-mode-hook #'eldoc-mode)
;;; racerやrustfmt、コンパイラにパスを通す
(add-to-list 'auto-mode-alist '("\\.rs\\'" . rust-mode))
(add-to-list 'exec-path (expand-file-name "~/.cargo/bin/"))
;;; rust-modeでrust-format-on-saveをtにすると自動でrustfmtが走る
(eval-after-load "rust-mode"
  '(setq-default rust-format-on-save t))

(add-hook 'rust-mode-hook #'company-mode)

;; my-rust.el ends here
