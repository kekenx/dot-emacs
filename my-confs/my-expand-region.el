;;; my-expand-region.el --- expand-region configuration
;;; Commentary:
;;; ...

;;; Code:
(ensure-package-installed 'expand-region)

(require 'expand-region)
(global-set-key (kbd "M-@") 'er/expand-region)
(global-set-key (kbd "M-s") 'er/contract-region)
;;; my-expand-region.el ends here
