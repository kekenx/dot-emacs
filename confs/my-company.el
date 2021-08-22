;;; my-company.el --- company configuration
;;; Commentary:
;;; my company configuration --- ...

;;; Code:

(use-package company
  :ensure t
  :init
  (global-company-mode)
  (setq company-idle-delay 0)
  (setq company-minimum-prefix-length 2)
  (setq company-selection-wrap-around t))

;;; my-company.el ends here
