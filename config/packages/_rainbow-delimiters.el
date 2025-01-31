(use-package rainbow-delimiters
  :ensure t
  :hook ((prog-mode . rainbow-delimiters-mode)
         (emacs-lisp-mode-hook . rainbow-delimiters-mode)
         (ielm-mode-hook . rainbow-delimiters-mode)
         (lisp-interaction-mode-hook . rainbow-delimiters-mode)
         (lisp-mode-hook . rainbow-delimiters-mode)
         (slime-repl-mode-hook . rainbow-delimiters-mode)
         (sly-mrepl-mode . rainbow-delimiters-mode)))

(add-hook 'slime-repl-mode-hook 'rainbow-delimiters-mode)

(provide '_rainbow-delimiters)
