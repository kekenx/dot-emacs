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

(use-package python-black
  :ensure t
  :after python
  :init
  (add-hook 'before-save-hook 'python-black-buffer))

(use-package python-isort
  :ensure t
  :init
  (add-hook 'before-save-hook 'python-isort-buffer))
;;; my-python.el ends here
