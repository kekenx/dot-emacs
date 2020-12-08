;;; my-typescript.el --- typescript support
;;; Commentary:
;;; Code:

(add-to-list 'auto-mode-alist '("\\.[jt]sx\\'" . typescript-mode))
(defun setup-tide-mode ()
  "Setup function for tide."
  (interactive)
  (tide-setup)
  (flycheck-mode +1)
  (setq flycheck-check-syntax-automatically '(save mode-enabled))
  (eldoc-mode +1)
  (tide-hl-identifier-mode +1)
  (company-mode +1))

(setq company-tooltip-align-annotations t)

(add-hook 'typescript-mode-hook #'setup-tide-mode)
(add-hook 'typescript-mode-hook 'prettier-js-mode)
(setq prettier-js-args '(
  "--trailing-comma" "none"
  "--bracket-spacing" "true"
  "--single-quote" "true"
  "--jsx-single-quote" "true"
  "--jsx-bracket-same-line" "true"
  "--print-width" "100"))
;;; my-typescript.el ends here~
