;;; package --- clojure config
;;; Commentary:
;;; Code:

(use-package clojure-mode
  :ensure t
  :after lsp-mode
  :preface
  (defun cider-toggle-lsp-completion-maybe ()
    (lsp-completion-mode (if (bound-and-true-p cider-mode) -1 1))))

(setq gc-cons-threshold (* 100 1024 1024)
      read-process-output-max (* 1024 1024)
      treemacs-space-between-root-nodes nil
      company-minimum-prefix-length 1
      ; lsp-enable-indentation nil ; uncomment to use cider indentation instead of lsp
      ; lsp-enable-completion-at-point nil ; uncomment to use cider completion instead of lsp
      )

(use-package cider
  :ensure t
  :config
  ;; (cider-enable-flex-completion)
  (setq clojure-toplevel-inside-comment-form t)
  (setq tab-always-indent 'complete)
  (setq cider-enrich-classpath t))

(use-package smartparens-mode
  :ensure smartparens  ;; install the package
  :hook (clojure-mode
         clojurescript-mode
         clojurec-mode
         prog-mode
         text-mode
         markdown-mode
         eval-expression-minibuffer-setup-hook
         emacs-lisp-mode-hook
         ielm-mode-hook
         lisp-interaction-mode-hook
         lisp-mode-hook
         slime-repl-mode-hook
         sly-mrepl-mode-hook) ;; add `smartparens-mode` to these hooks
  :config
  ;; load default config
  ;; (require 'smartparens-config)
  (require (progn (show-smartparens-global-mode t)))
  :bind (("M-(" . sp-wrap-round)
         ("M-[" . sp-wrap-square)
         ("M-{" . sp-wrap-curly)
         ("M-)" . sp-unwrap-round)
         ("M-]" . sp-unwrap-square)
         ("M-}" . sp-unwrap-curly)
         ("C-<right>" . sp-forward-slurp-sexp)
         ("C-<left>" . sp-forward-barf-sexp)
         ("M-<right>" . sp-backward-slurp-sexp)
         ("M-<left>" . sp-backward-barf-sexp)
         ("C-M-t" . sp-transpose-sexp)))

(add-hook 'sly-mrepl-mode-hook 'smartparens-mode)
(add-hook 'slime-repl-mode-hook 'smartparens-mode)

(provide '_clojure)
;;; _clojure.el ends here
