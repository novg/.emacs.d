;; _python.el -- custom python configuration

;;; Commentary:

;;; Code:

(elpy-enable)

;; Use IPython for REPL
;; (setq python-shell-interpreter "jupyter"
      ;; python-shell-interpreter-args "console --simple-prompt"
      ;; python-shell-prompt-detect-failure-warning nil)
;; (add-to-list 'python-shell-completion-native-disabled-interpreters


(when (require 'flycheck nil t)
  (setq elpy-modules (delq 'elpy-module-flymake elpy-modules))
  (add-hook 'elpy-mode-hook 'flycheck-mode))

;; enable autopep8 formatting on save
;; ignoring:
;; - E501 - Try to make lines fit within --max-line-length characters.
;; - W293 - Remove trailing whitespace on blank line.
;; - W391 - Remove trailing blank lines.
;; - W690 - Fix various deprecated code (via lib2to3).
(require 'py-autopep8)
;; (setq py-autopep8-options '("--ignore=E501,W293,W391,W690"))
(add-hook 'elpy-mode-hook 'py-autopep8-enable-on-save)

;; (define-key global-map (kbd "RET") 'newline-and-indent)


(provide '_python)

;;; _python.el ends here
