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

;; Allow package.el to upgrade BUILT-IN packages from an archive.  This is
;; required on Emacs 30+, where `transient' ships built-in (v0.8.x) but
;; claude-code-ide/magit need a newer MELPA transient (>= 0.9.0).  Without
;; this, `package-install' refuses to replace the built-in copy, the old one
;; loads, and stray newer bits collide ("Invalid function: static-when" /
;; "transient--init-suffix-key is already defined as something else than a
;; generic function").  (Available since Emacs 29.1.)
(setq package-install-upgrade-built-in t)

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
;;
;; transient uses compat's compile-time-only `static-when' macro.  compat must
;; therefore be installed BEFORE transient, so transient byte-compiles cleanly
;; (otherwise transient loads as source and errors with
;; "Invalid function: static-when").  Installing compat first guarantees the
;; correct order on a fresh machine.
;; compat >= 31 provides the `static-when' macro that modern transient uses.
;; Version-gate so an older cached compat actually gets upgraded.
(unless (package-installed-p 'compat '(31))
  (package-install 'compat))
;; Load compat eagerly so its compile-time-only macros (notably `static-when')
;; are also defined at runtime -- belt-and-suspenders if transient ever loads
;; as source instead of a compat-aware .elc.
(require 'compat)
;; Version-gate transient on 0.9.0 so the built-in 0.8.x triggers an upgrade
;; to the MELPA version that claude-code-ide requires (see the built-in
;; upgrade note above).
(unless (package-installed-p 'transient '(0 9 0))
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
