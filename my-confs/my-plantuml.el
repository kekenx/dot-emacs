;;; my-plantuml.el --- plantuml configuration
;;; Commentary:
;;; plantuml configuration. This will be activated only when os is darwin

;;; Code:

(defun load-plantuml ()
  (ensure-package-installed 'plantuml-mode)
  (add-to-list 'auto-mode-alist '("\\.pu\\'" . plantuml-mode))
  (setq plantuml-executable-path "/usr/local/bin/plantuml")
  (setq plantuml-default-exec-mode 'executable)
  ;; for java option if neccessary
  ;; (setq plantuml-output-type "png")
  (setq plantuml-java-options "")
  (setq tab-width 4)
  ;; (setq plantuml-default-exec-mode 'executable)
  (setq plantuml-options "-charset UTF-8"))

(when (equal system-type 'darwin)
  (load-plantuml))
;;; my-plantuml.el ends here
