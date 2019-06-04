;;; my-helm.el --- helm configuration
;;; Commentary:
;;; only the helm configuration --- ...

;;; Code:
(ensure-package-installed 'ag 'helm 'helm-ag)

(require 'helm-config)
(helm-mode 1)

;; all the default key bind to helm
(global-set-key (kbd "M-x") 'helm-M-x)
(global-set-key (kbd "C-x C-f") 'helm-find-files)
(global-set-key (kbd "C-x C-g") 'helm-do-grep-ag)
(define-key helm-map (kbd "<tab>") 'helm-execute-persistent-action) ; rebind tab to do persistent action
(define-key helm-map (kbd "C-i") 'helm-execute-persistent-action) ; make TAB works in terminal
(define-key helm-map (kbd "C-z")  'helm-select-action) ; list actions using C-z
(put 'upcase-region 'disabled nil)

;; git grep by helm
(defun helm-ag-project-root ()
  (interactive)
  (let ((rootdir (helm-ag--project-root)))
    (unless rootdir
      (error "Could not find the project root. Create a git, hg, or svn repository there first. "))
    (helm-ag rootdir)))

(defun helm-ag--project-root ()
  (cl-loop for dir in '(".git/" ".hg/" ".svn/" ".git")
           when (locate-dominating-file default-directory dir)
           return it))
(global-set-key (kbd "M-p") 'helm-ag-project-root)
;;; my-helm.el ends here
