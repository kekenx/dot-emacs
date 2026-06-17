;;; early-init.el --- -*- lexical-binding: t; -*-
;;; Commentary:
;;; Runs before package.el and UI initialization.  We let package.el activate
;;; normally (package-enable-at-startup stays t) and just disable chrome early
;;; to avoid a visual flash during startup.

;;; Code:

(menu-bar-mode -1)
(when (fboundp 'tool-bar-mode) (tool-bar-mode -1))
(when (fboundp 'scroll-bar-mode) (scroll-bar-mode -1))

;;; early-init.el ends here
