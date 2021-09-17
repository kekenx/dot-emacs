;;; my-typescript.el --- typescript support
;;; Commentary: reference https://qiita.com/nuy/items/ebcb25ad14f02ab72790
;;; Code:
(use-package typescript-mode
  :ensure t
  :config
  (setq typescript-indent-level 2)
  (add-hook 'typescript-mode-hook
          (lambda ()
            (interactive)
            (mmm-mode)
            )))

(use-package mmm-mode
  :ensure t
  :commands mmm-mode
  :mode (
	 ("\\.tsx\\'" . typescript-mode)
	 ("\\.vue\\'" . typescript-mode)
	 )
  :config
  (setq mmm-global-mode t)
  (setq mmm-submode-decoration-level 0)
  (set-face-background 'mmm-default-submode-face "gray13")

  (mmm-add-classes
   '((mmm-jsx-mode
      :submode web-mode
      :face mmm-code-submode-face
      :front "\\(return\s\\|n\s\\|(\n\s*\\)<"
      :front-offset -1
      :back ">\n?\s*)\n}\n"
      :back-offset 1
      )
     (vue-embeded-slim-mode
      :submode slim-mode
      :front "^<template.*lang=\"pug\">\n"
      :back "^</template>"
      )
     (vue-embeded-web-mode
      :submode web-mode
      :front "^<template>\n"
      :back "^</template>\n"
      )
     (vue-embeded-js-mode
      :submode js-mode
      :front "^<script>\n"
      :back "^</script>"
      )
     (vue-embeded-scss-mode
      :submode scss-mode
      :front "^<style.*lang=\"scss\">\n"
      :back "^</style>")))
  (mmm-add-mode-ext-class 'typescript-mode nil 'mmm-jsx-mode)
  (mmm-add-mode-ext-class 'typescript-mode "\\.vue\\'" 'vue-embeded-slim-mode)
  (mmm-add-mode-ext-class 'typescript-mode "\\.vue\\'" 'vue-embeded-web-mode)
  (mmm-add-mode-ext-class 'typescript-mode "\\.vue\\'" 'vue-embeded-js-mode)
  (mmm-add-mode-ext-class 'typescript-mode "\\.vue\\'" 'vue-embeded-scss-mode)


  (defun mmm-reapply ()
    (mmm-mode)
    (mmm-mode))

  (add-hook 'after-save-hook
            (lambda ()
              (when (string-match-p "\\.tsx?" buffer-file-name)
                (mmm-reapply)
                )))
  )
;;; my-typescript.el ends here~
