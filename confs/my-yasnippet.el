;;; my-yasnippet.el --- my yasnipet configuration
;;; Commentary:
;;; yasnippet --- yasnippet

;;; Code:

(use-package yasnippet
  :ensure t
  :init
  (setq yas-snippet-dirs (append yas-snippet-dirs
				 '("~/snippets")))
  (yas-global-mode 1))

;;; my-yasnipet.el ends here
