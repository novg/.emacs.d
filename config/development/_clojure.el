(use-package lsp-mode
  :ensure t
  :hook ((cider-mode . cider-toggle-lsp-completion-maybe)
         (before-save . lsp-format-buffer)
         (clojure-mode . lsp)
         (clojurec-mode . lsp)
         (clojurescript-mode . lsp))
         ;; (clojure-mode . smartparens-strict-mode)
         ;; (clojurec-mode . smartparens-strict-mode)
         ;; (clojurescript-mode . smartparens-strict-mode))
  :custom
  (lsp-keymap-prefix "C-c l")
  (lsp-clojure-custom-server-command '("bash" "-c" "~/.emacs.d/lsp/clojure-lsp")))

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

(setq tab-always-indent 'complete)

(use-package cider
  :ensure t)

(use-package lsp-treemacs
  :ensure t)

(use-package flycheck
  :ensure t)

(use-package company
  :ensure t)

(use-package smartparens-mode
  :ensure smartparens  ;; install the package
  :hook (clojure-mode clojurescript-mode clojurec-mode prog-mode text-mode markdown-mode) ;; add `smartparens-mode` to these hooks
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
         ("C-<right>" . 'sp-forward-slurp-sexp)
         ("C-<left>" . sp-forward-barf-sexp)
         ("M-<right>" . sp-backward-slurp-sexp)
         ("M-<left>" . sp-backward-barf-sexp)
         ("C-M-t" . sp-transpose-sexp)))

(use-package which-key
  :ensure t
  :config
  (which-key-mode 1))

(provide '_lsp-clojure)
