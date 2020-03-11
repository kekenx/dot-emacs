;;; my-cc.el --- cc configuration
;;; Commentary:
;;; ...

;;; Code:
(setq auto-mode-alist
      (append
       '(
         ("\\.c$"    . c-mode)
         ("\\.h$"    . c-mode)
         ("\\.java$" . java-mode)
         ("\\.c\\+\\+$" . c++-mode)
         ("\\.cpp$"  . c++-mode)
         ("\\.cc$"   . c++-mode)
         ("\\.hh$"   . c++-mode)
         )
       auto-mode-alist))
(add-hook 'c++-mode-hook (lambda () (setq flycheck-gcc-language-standard "c++14")))
;;; my-cc.el ends here
