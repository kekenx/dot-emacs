;;; init.el --- Initialization file for Emacs
;;; Commentary:
;;; Emacs Startup File --- initialization for Emacs

;;; Code:
(setq load-path (cons"~/.emacs.d/elisp" load-path))
(require 'package)
(add-to-list 'package-archives
	     '("melpa" . "https://melpa.org/packages/"))

;; well... just install emacs version > 24...
(when (< emacs-major-version 24)
  (add-to-list 'package-archives '("gnu" . "http://elpa.gnu.org/packages/")))
(package-initialize)

(unless package-archive-contents (package-refresh-contents))
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

(ensure-package-installed 'use-package)
(require 'use-package)

(defun load-directory (dir)
  (let ((load-it (lambda (f)
		   (load-file (concat (file-name-as-directory dir) f)))
		 ))
    (mapc load-it (directory-files dir nil "\\.el$"))))
(load-directory "~/dot-emacs/confs/")

;; Use different file for Custom.
(setq custom-file (locate-user-emacs-file "custom.el"))

;; Create custom.el if not exist
(unless (file-exists-p custom-file)
  (write-region "" nil custom-file))
(load custom-file)

;;; init.el ends here
