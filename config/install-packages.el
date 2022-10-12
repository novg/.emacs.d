;; Enables basic packaging support
(require 'package)

;; Add the Melpa archive to the list of avilable repositories
(add-to-list 'package-archives
             '("melpa" . "https://melpa.org/packages/"))

(package-initialize)

;; If there are no archived package contents, refresh them
(when (not package-archive-contents)
  (package-refresh-contents))

;; Installs packages
;;
;; my-packages contains a list of package names
(defvar my-packages
  '(better-defaults        ;; Set up better Emacs defaults
    helm                   ;; Emacs incremental completion and selection narrowing framework
    clojure-mode           ;; Major mode for editing Clojure and ClojureScript code
    cider                  ;; Clojure interactive development environment and REPL for Emacs
    lsp-mode
    company
    flycheck
    rainbow-delimiters     ;; Highlights parentheses, brackets, and braces according to their depth
    smartparens
    ))

;; Scan the list in my-packages
(mapc #'(lambda (package)
	  (unless (package-installed-p package)
	    (package-install package)))
      my-packages)

;; Settings packages
(add-hook 'clojure-mode-hook #'rainbow-delimiters-mode)

(show-smartparens-global-mode t)
(add-hook 'prog-mode-hook 'turn-on-smartparens-strict-mode)
(add-hook 'markdown-mode-hook 'turn-on-smartparens-strict-mode)
(global-set-key (kbd "C-<right>") 'sp-forward-slurp-sexp)
(global-set-key (kbd "M-<right>") 'sp-forward-barf-sexp)
(global-set-key (kbd "C-<left>") 'sp-backward-slurp-sexp)
(global-set-key (kbd "M-<left>") 'sp-backward-barf-sexp)
(global-set-key (kbd "M-]") 'sp-unwrap-sexp)
(global-set-key (kbd "M-[") 'sp-backward-unwrap-sexp)


(provide 'install-packages)
