;;; custom.el --- General Custom emacs configuration
;;; Commentary:
;;; Emacs general setup --- ...

;;; Code:

(prefer-coding-system 'utf-8)
(setq inhibit-startup-screen t)
;; define function to check if required packages are installed
(defun ensure-package-installed (&rest packages)
  (mapcar
   (lambda (package)
     (if (package-installed-p package)
	 nil
       (if (y-or-n-p (format "Package %s is missing. Install it?" package))
	   (package-install package)
	 package)))
   packages))

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
    (if (>= (window-body-width) 270)
        (split-window-horizontally-n 3)
      (split-window-horizontally)))
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
;; custom.el ends here
