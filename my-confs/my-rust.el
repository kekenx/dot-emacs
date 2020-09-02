;;; my-rust.el --- rust configuration
;;; Commentary:
;;; python configuration --- ...

;;; Code:
(ensure-package-installed 'rust-mode 'flycheck-rust)

(with-eval-after-load 'rust-mode
  (add-hook 'flycheck-mode-hook #'flycheck-rust-setup))


;;; my-rust.el ends here
