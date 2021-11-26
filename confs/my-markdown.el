;;; my-markdown.el --- markdown-mode configuration
;;; Commentary:
;;; markdown-mode configuration --- ...

;;; Code:

(use-package markdown-mode
  :ensure t
  :mode ("\\.md\\'")
  )

(use-package markdown-preview-mode
  :ensure t
  :mode ("\\.md\\'")
  :init
  (setq markdown-preview-stylesheets 
	(list "https://cdnjs.cloudflare.com/ajax/libs/github-markdown-css/3.0.1/github-markdown.min.css"))
  )
;;; my-markdown.el ends here
