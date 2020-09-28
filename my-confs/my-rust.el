;;; my-rust.el --- rust configuration
;;; Commentary:
;;; python configuration --- ...

;;; Code:
(ensure-package-installed 'rust-mode 'flycheck-rust 'racer)

;;; Add path to the compiler, racer and rustfmt
(add-to-list 'exec-path (expand-file-name "~/.cargo/bin/"))
;;; auto format on save
(eval-after-load "rust-mode"
  '(setq-default rust-format-on-save t))

(add-hook 'rust-mode-hook (lambda ()
                            (racer-mode)
                            (flycheck-rust-setup)))
;;; eldoc suppor on racer
(add-hook 'racer-mode-hook #'eldoc-mode)
;;; racer auto-complete
(add-hook 'racer-mode-hook (lambda ()
                             (company-mode)
                             (set (make-variable-buffer-local 'company-idle-delay) 0.1)
                             (set (make-variable-buffer-local 'company-minimum-prefix-length) 0)))

;;; my-rust.el ends here
