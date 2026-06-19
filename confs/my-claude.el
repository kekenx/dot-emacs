;;; my-claude.el --- Claude Code IDE configuration -*- lexical-binding: t; -*-
;;; Commentary:
;;; claude-code-ide is a git-only package (not on any ELPA archive), so we
;;; install it with package.el's VC support via `package-vc-install', which
;;; exists on both Emacs 29 and 30.  use-package then just configures it
;;; (:ensure nil, since it's already installed and on the load-path).
;;;
;;; It runs inside a vterm terminal, so vterm is installed here too.

;;; Code:

;; Add C-t to vterm's exception list BEFORE vterm loads, so
;; `other-window-or-split' (C-t) keeps working inside claude-code-ide buffers.
(setq vterm-keymap-exceptions
      '("C-c" "C-x" "C-u" "C-g" "C-h" "C-l" "M-x" "M-o" "C-y" "M-y" "C-t"))

;; The Claude CLI (v2.1.89+) defaults to a fullscreen TUI rendered on the
;; terminal's ALTERNATE screen (like vim/less), which has no scrollback -- so
;; vterm-copy-mode can only show the current frame, not older messages.  This
;; env var reverts to the classic renderer that streams to the normal buffer,
;; restoring vterm scrollback.  Set in Emacs so it applies to the `claude'
;; subprocess regardless of how Emacs itself was launched (iTerm, tmux+ssh).
;; See https://code.claude.com/docs/en/fullscreen
(setenv "CLAUDE_CODE_DISABLE_ALTERNATE_SCREEN" "1")

;; Install vterm but load it lazily: the first time something calls `vterm'
;; (e.g. claude-code-ide opening a terminal) it loads and offers to compile
;; its native module once.  Deferring avoids a compile prompt at every startup.
(use-package vterm
  :ensure t
  :defer t)

;; Install claude-code-ide from git via package.el VC (portable to 29 and 30).
(unless (package-installed-p 'claude-code-ide)
  (package-vc-install "https://github.com/manzaltu/claude-code-ide.el"))

(use-package claude-code-ide
  :ensure nil                          ; installed via package-vc-install above
  :after transient
  :config
  ;; Refresh the claude-code buffer display (fixes occasional duplicate
  ;; sections) by switching away and back.
  (defun my-claude-refresh-display ()
    "Refresh claude-code buffer by switching away and back."
    (interactive)
    (when (claude-code-ide--session-buffer-p (current-buffer))
      (let ((claude-buf (current-buffer)))
        (switch-to-buffer "*scratch*")
        (switch-to-buffer claude-buf))))

  ;; Bind to C-c r for quick manual refresh when needed.
  (with-eval-after-load 'vterm
    (define-key vterm-mode-map (kbd "C-c r") #'my-claude-refresh-display)))

;;; my-claude.el ends here
