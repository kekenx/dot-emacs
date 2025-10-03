;;; my-python.el --- python configuration
;;; Commentary:
;;; python configuration --- ...

;;; Code:

;; -------------------------------------------------------------
;; LSP: ruff‑lsp via Eglot
;; -------------------------------------------------------------
(use-package eglot
  :defer t
  :hook (python-mode . eglot-ensure)
  :config
  ;; Use ruff-lsp for python buffers
  (add-to-list 'eglot-server-programs '(python-mode . ("ruff-lsp")))
  ;; Tell Eglot to stay out of Flymake so we can rely on Flycheck
  (setq eglot-stay-out-of '(flymake)))

;; -------------------------------------------------------------
;; Flycheck diagnostics with a custom Ruff checker
;; -------------------------------------------------------------
(use-package flycheck
  :ensure t
  :hook (python-mode . flycheck-mode)
  :config
  (flycheck-define-checker python-ruff
    "A Python syntax and style checker using Ruff."
    :command ("ruff" "check" "--quiet" source-original)
    :error-patterns ((error line-start (file-name) ":" line ":" column ":" " E" (id (one-or-more digit)) " " (message) line-end)
                     (warning line-start (file-name) ":" line ":" column ":" " W" (id (one-or-more digit)) " " (message) line-end)
                     (info line-start (file-name) ":" line ":" column ":" " N" (id (one-or-more digit)) " " (message) line-end))
    :modes python-mode)

  (add-to-list 'flycheck-checkers 'python-ruff))

;; -------------------------------------------------------------
;; Auto‑format on save via Reformatter + Ruff
;; -------------------------------------------------------------
(use-package reformatter
  :ensure t)

(reformatter-define ruff-organize-imports
  :program "ruff"
  :args '("check" "--select" "I" "--fix" "--stdin-filename" "stdin.py" "-")
  :stdin t)

(add-hook 'python-mode-hook #'ruff-organize-imports-on-save-mode)


(reformatter-define ruff-format
  :program "ruff"
  :args '("format" "-"))

(add-hook 'python-mode-hook #'ruff-format-on-save-mode)

;; -------------------------------------------------------------
;; python-mode quality‑of‑life tweaks (optional)
;; -------------------------------------------------------------
(use-package python
  :ensure nil  ;; built‑in package
  :custom
  (python-indent-guess-indent-offset t)
  (python-indent-guess-indent-offset-verbose nil))

(provide 'python-config)
;;; python-config.el ends here

