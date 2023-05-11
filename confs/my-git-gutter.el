;;; my-git-gutter.el --- git-gutter+ configuration
;;; Commentary:
;;; ...

;;; Code:

(use-package git-gutter+
  :ensure t
  :init (global-git-gutter+-mode)
  :config (progn
            (define-key git-gutter+-mode-map (kbd "C-x c") 'git-gutter+-commit)
            (define-key git-gutter+-mode-map (kbd "C-x S-c") 'git-gutter+-stage-and-commit)
            (define-key git-gutter+-mode-map (kbd "C-x C-y") 'git-gutter+-stage-and-commit-whole-buffer)
            (define-key git-gutter+-mode-map (kbd "C-x S-u") 'git-gutter+-unstage-whole-buffer))
  :diminish (git-gutter+-mode . "gg"))

;;; my-git-gutter ends here
