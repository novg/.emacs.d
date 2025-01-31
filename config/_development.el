;;; package -- Summary:
;;; Commentary:
;;; Code:

(use-package lsp-mode
  :ensure t
  :hook ((cider-mode . cider-toggle-lsp-completion-maybe)
         (clojure-mode . lsp)
         (clojurec-mode . lsp)
         (clojurescript-mode . lsp)
         (before-save . lsp-format-buffer)
         (csharp-mode . lsp))
  :custom
  (lsp-keymap-prefix "C-c l")
  (lsp-clojure-custom-server-command '("bash" "-c" "~/.emacs.d/lsp/clojure-lsp"))
  :commands lsp)

(use-package lsp-ui
  :ensure t
  :commands lsp-ui-mode)

(use-package lsp-treemacs
  :ensure t
  :commands lsp-treemacs-errors-list)

(use-package company
  :ensure t
  :mode "company-mode")

(use-package company-box
  :ensure t
  :hook
  (company-mode . company-box-mode))

(use-package flycheck
  :ensure t
  :init
  (global-flycheck-mode))

(use-package projectile
  :ensure t)
(projectile-mode +1)
(define-key projectile-mode-map (kbd "C-c p") 'projectile-command-map)

;;
(require '_clojure)
;; (require '_dotnet)
(require '_cl)

(provide '_development)
;;; _development.el ends here
