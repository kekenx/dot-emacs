;;; my-typescript.el --- typescript support
;;; Commentary: reference https://qiita.com/nuy/items/ebcb25ad14f02ab72790
;;; Code:
;; (use-package typescript-mode
;;   :config
;;   (setq typescript-indent-level 2)
;;   (add-hook 'typescript-mode-hook
;;           (lambda ()
;;             (interactive)
;;             (mmm-mode)
;;             )))

;; (use-package mmm-mode
;;   :commands mmm-mode
;;   :mode (("\\.tsx\\'" . typescript-mode))
;;   :config
;;   (setq mmm-global-mode t)
;;   (setq mmm-submode-decoration-level 0)
;;   (mmm-add-classes
;;    '((mmm-jsx-mode
;;       :submode web-mode
;;       :face mmm-code-submode-face
;;       :front "\\(return\s\\|n\s\\|(\n\s*\\)<"
;;       :front-offset -1
;;       :back ">\n?\s*)\n}\n"
;;       :back-offset 1
;;       )))
;;   (mmm-add-mode-ext-class 'typescript-mode nil 'mmm-jsx-mode)


;;   (defun mmm-reapply ()
;;     (mmm-mode)
;;     (mmm-mode))

;;   (add-hook 'after-save-hook
;;             (lambda ()
;;               (when (string-match-p "\\.tsx?" buffer-file-name)
;;                 (mmm-reapply)
;;                 )))
;;   )

(use-package web-mode
  :ensure t
  :init
  (add-to-list 'auto-mode-alist '("\\.ts\\'" . web-mode))
  (add-to-list 'auto-mode-alist '("\\.tsx\\'" . web-mode))

  :config
  (setq web-mode-attr-indent-offset nil)

  (setq web-mode-enable-auto-closing t)
  (setq web-mode-enable-auto-pairing t)

  (setq web-mode-auto-close-style 2)
  (setq web-mode-tag-auto-close-style 2)


  (setq web-mode-markup-indent-offset 2)
  (setq web-mode-css-indent-offset 2)
  (setq web-mode-code-indent-offset 2)

  (setq indent-tabs-mode nil)
  (setq tab-width 2)
  )


;;; my-typescript.el ends here~
