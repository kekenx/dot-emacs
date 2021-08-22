;;; my-python.el --- python configuration
;;; Commentary:
;;; python configuration --- ...

;;; Code:

(use-package epc
  :ensure t)

(use-package jedi
  :ensure t)

(use-package python
  :ensure t
  :mode ("\\.py\\'" . python-mode)
  :interpreter ("python" . python-mode)
  :init
  (add-hook 'python-mode-hook 'jedi:setup)
  (setq jedi:complete-on-dot t)
  (add-hook 'python-mode-hook 'jedi:ac-setup)
  (flycheck-mode 1))

;;; my-python.el ends here
