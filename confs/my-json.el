;;; my-json.el --- json configuration
;;; Commentary:
;;; json configuration --- ...

;;; Code:
(use-package json-mode
  :ensure t
  :mode (("\\.json\\'" . json-mode))
  :config
  (setq js-indent-level 2)
)

;; my-json.el ends here
