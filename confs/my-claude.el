;;; my-claude.el --- Claude Code IDE configuration
;;; Commentary:
;;; Configuration for claude-code-ide integration

;;; Code:

;; Add C-t to vterm exceptions BEFORE vterm loads
;; This allows C-t (other-window-or-split) to work in claude-code-ide buffers
(setq vterm-keymap-exceptions
      '("C-c" "C-x" "C-u" "C-g" "C-h" "C-l" "M-x" "M-o" "C-y" "M-y" "C-t"))

(use-package claude-code-ide
  :after transient
  :ensure (:type git :host github :repo "manzaltu/claude-code-ide.el")
  :config
  ;; Command to refresh claude-code buffer display (fixes duplicate sections)
  (defun my-claude-refresh-display ()
    "Refresh claude-code buffer by switching away and back."
    (interactive)
    (when (claude-code-ide--session-buffer-p (current-buffer))
      (let ((claude-buf (current-buffer)))
        (switch-to-buffer "*scratch*")
        (switch-to-buffer claude-buf))))

  ;; Bind to C-c r for quick manual refresh when needed
  (with-eval-after-load 'vterm
    (define-key vterm-mode-map (kbd "C-c r") #'my-claude-refresh-display)))

;;; my-claude.el ends here
