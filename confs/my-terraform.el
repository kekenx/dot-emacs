;;; my-terraform.el --- terraform configuration
;;; Commentary:
;;; terraform configuration --- ...

;;; Code:
(use-package terraform-mode
  :ensure t
  :custom terraform-format-on-save t
)

(use-package company-terraform
  :ensure t
  :init
  (company-terraform-init)
)
;; my-terraform.el ends here
