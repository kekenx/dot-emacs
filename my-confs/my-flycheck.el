;;; my-flycheck.el --- flycheck configuration
;;; Commentary:
;;; flycheck configuration file --- ...

;;; Code:
(ensure-package-installed 'flycheck)
;; enable flycheck for any major-mode specified
(add-hook 'after-init-hook #'global-flycheck-mode)
;;; my-flycheck.el ends here
