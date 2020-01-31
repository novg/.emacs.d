;; _python.el -- custom python configuration

;;; commentary:

;;; code:

;; (elpy-enable)

;; use ipython for repl
;; (setq python-shell-interpreter "jupyter"
      ;; python-shell-interpreter-args "console --simple-prompt"
      ;; python-shell-prompt-detect-failure-warning nil)
;; (add-to-list 'python-shell-completion-native-disabled-interpreters


;; (when (require 'flycheck nil t)
  ;; (setq elpy-modules (delq 'elpy-module-flymake elpy-modules))
  ;; (add-hook 'elpy-mode-hook 'flycheck-mode))

;; enable autopep8 formatting on save
;; ignoring:
;; - E501 - Try to make lines fit within --max-line-length characters.
;; - W293 - Remove trailing whitespace on blank line.
;; - W391 - Remove trailing blank lines.
;; - W690 - Fix various deprecated code (via lib2to3).
;; (require 'py-autopep8)
;; (setq py-autopep8-options '("--ignore=E501,W293,W391,W690"))
;; (add-hook 'elpy-mode-hook 'py-autopep8-enable-on-save)

;; (define-key global-map (kbd "RET") 'newline-and-indent)
;; (require 'lsp-mode)

;; (require 'lsp-ui-imenu)
;; (add-hook 'lsp-after-open-hook 'lsp-enable-imenu)


;; (lsp-register-client
 ;; (make-lsp-client :new-connection (lsp-stdio-connection "pyls")
                  ;; :major-modes '(python-mode)
                  ;; :server-id 'pyls))


;; (add-hook 'python-mode-hook
          ;; (lambda ()
            ;; (lsp-python-enable)))

;; (require 'lsp-ui)
;; (setq lsp-ui-sideline-ignore-duplicate t)
;; (add-hook 'lsp-mode-hook 'lsp-ui-mode)

;; (push 'company-lsp company-backends)


;; (add-hook 'python-mode-hook #'lsp)


;; (require 'company-lsp)
;; (push 'company-lsp company-backends)

;; KEYBINDINGS

;; (global-set-key (kbd "<f4>") 'lsp-find-definition)
;; (global-set-key (kbd "M-<f7>") 'lsp-find-references)
;; (global-set-key (kbd "S-<f6>") 'lsp-rename)
;; (global-set-key (kbd "C-?") 'company-lsp)

;; (add-hook 'after-save-hook 'lsp-format-buffer)



(provide '_python)

;;; _python.el ends here
