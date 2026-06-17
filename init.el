;;; init.el --- Initialization file for Emacs -*- lexical-binding: t; -*-
;;; Commentary:
;;; Emacs startup file.  Bootstraps the built-in package.el manager and
;;; use-package, then loads per-feature configuration from ~/dot-emacs/confs/.
;;;
;;; Targets Emacs 29 and 30.  A single package manager (package.el) is used
;;; on purpose: running both package.el and Elpaca at once previously caused
;;; duplicate, version-skewed copies of packages on the load-path.

;;; Code:

(require 'package)

;; Package archives.  gnu + nongnu provide core/built-in-adjacent packages,
;; melpa provides the bulk of third-party packages.
(setq package-archives
      '(("gnu"    . "https://elpa.gnu.org/packages/")
        ("nongnu" . "https://elpa.nongnu.org/nongnu/")
        ("melpa"  . "https://melpa.org/packages/")))

(package-initialize)

;; Refresh the archive contents the first time (or after a clean wipe).
(unless package-archive-contents
  (package-refresh-contents))

;; use-package is built in on Emacs 29+; install it as a fallback just in case.
(unless (package-installed-p 'use-package)
  (package-install 'use-package))
(require 'use-package)

;; Every (use-package ...) installs its package unless it says :ensure nil.
;; Built-in packages (org, python, eglot, claude-code-ide via VC) opt out.
(setq use-package-always-ensure t)

;; Pin transient from MELPA so both Emacs 29 and 30 get the modern version
;; that claude-code-ide and magit need (shadows any older bundled copy).
(unless (package-installed-p 'transient)
  (package-install 'transient))

;; Keep Customize's auto-generated settings in their own file, out of the repo.
(setq custom-file (locate-user-emacs-file "custom.el"))
(unless (file-exists-p custom-file)
  (write-region "" nil custom-file))
(load custom-file)

;; Load every .el file in confs/ (non-recursively, alphabetical order).
(defun load-directory (dir)
  "Load every .el file directly under DIR, in alphabetical order."
  (dolist (file (directory-files dir t "\\.el\\'"))
    (load file)))

(load-directory "~/dot-emacs/confs/")

;;; init.el ends here
