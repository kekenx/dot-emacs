;;; my-yasnippet.el --- my yasnipet configuration
;;; Commentary:
;;; yasnippet --- yasnippet

;;; Code:
(ensure-package-installed 'yasnippet-snippets)

(add-to-list 'load-path
             (expand-file-name "~/.emacs.d/site-lisp/yasnippet"))

(require 'yasnippet)
;; (setq yas-snippet-dirs
;;       '("~/emacs/my-snippets"
;; 	"~/.emacs.d/snippets"
;;         ))

(yas-global-mode 1)

;;; my-yasnipet.el ends here
