;;; custom.el --- General Custom emacs configuration
;;; Commentary:
;;; Emacs general setup --- ...

;;; Code:

(prefer-coding-system 'utf-8)

(setq inhibit-startup-screen t)
;; split windows, move between windows  by C-t.
(defun split-window-vertically-n (num_wins)
  (interactive "p")
  (if (= num_wins 2)
      (split-window-vertically)
    (progn
      (split-window-vertically
       (- (window-height) (/ (window-height) num_wins)))
      (split-window-vertically-n (- num_wins 1)))))
(defun split-window-horizontally-n (num_wins)
  (interactive "p")
  (if (= num_wins 2)
      (split-window-horizontally)
    (progn
      (split-window-horizontally
       (- (window-width) (/ (window-width) num_wins)))
      (split-window-horizontally-n (- num_wins 1)))))

(defun other-window-or-split ()
  (interactive)
  (when (one-window-p)
    (split-window-horizontally-n 3))
  (other-window 1))

(global-set-key (kbd "C-t") 'other-window-or-split)

;; disabling backups
(setq backup-inhibited t)
(setq auto-save-default nil)

;; enalbe which-function-mode; mode that displays which function currently working on
(which-function-mode 1)

;; set eshell to C-z by default
(global-set-key (kbd "C-z") 'eshell)

;; compile with makefile with C-c C-c
(global-unset-key (kbd "C-c C-c"))
(global-set-key (kbd "C-c o") 'compile)

(load-theme 'manoj-dark t)

(use-package rainbow-delimiters
  :ensure t
  :hook (prog-mode . rainbow-delimiters-mode)
  )

(require 'cl-lib)
(require 'color)
(defun rainbow-delimiters-using-stronger-colors ()
  (interactive)
  (cl-loop
   for index from 1 to rainbow-delimiters-max-face-count
   do
   (let ((face (intern (format "rainbow-delimiters-depth-%d-face" index))))
    (cl-callf color-saturate-name (face-foreground face) 15))))
(add-hook 'emacs-startup-hook 'rainbow-delimiters-using-stronger-colors)
;; custom.el ends here
