;;; my-python.el --- python configuration
;;; Commentary:
;;; python configuration --- ...

;;; Code:
(ensure-package-installed 'python-mode 'jedi)

;; (require 'python-mode)
;; (add-to-list 'auto-mode-alist '("\\.py$'" . python-mode))
;; (add-to-list 'interpreter-mode-alist '("python" . python-mode))

(require 'epc)
(require 'python)
(require 'jedi)
(add-hook 'python-mode-hook 'jedi:setup)
(setq jedi:complete-on-dot t)
(add-hook 'python-mode-hook 'jedi:ac-setup)
;; (add-hook 'python-mode-hook' 'py-yapf-enable-on-save)


;;; my-python.el ends here
