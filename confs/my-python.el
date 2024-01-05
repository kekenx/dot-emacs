;;; my-python.el --- python configuration
;;; Commentary:
;;; python configuration --- ...

;;; Code:

(use-package python-black
  :ensure t
  )

(use-package python-isort
  :ensure t
  )

(use-package python
  :ensure t
  :mode ("\\.py\\'" . python-mode)
  :interpreter ("python" . python-mode)
  :init
  (add-hook 'python-mode-hook
	    (lambda()
	      (add-hook 'before-save-hook 'python-black-buffer nil t)))
  (add-hook 'python-mode-hook
	    (lambda()
	      (add-hook 'before-save-hook 'python-isort-buffer nil t)))
  (flycheck-mode 1))


;;; my-python.el ends here
