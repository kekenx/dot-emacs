;;; my-yasnippet.el --- my yasnipet configuration
;;; Commentary:
;;; yasnippet --- yasnippet

;;; Code:
(ensure-package-installed 'yasnippet-snippets)

(require 'yasnippet)
(setq yas-snippet-dirs (append yas-snippet-dirs
                               '("~/emacs/my-snippets")))

(yas-global-mode 1)

;;; my-yasnipet.el ends here
