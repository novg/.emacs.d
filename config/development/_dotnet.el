;;; package --- dotnet config
;;; Commentary:
;;; Code:
(use-package csharp-mode
  :ensure t
  :init
  (add-hook 'csharp-mode-hook #'company-mode)
  (add-hook 'csharp-mode-hook #'rainbow-delimiters-mode))

(use-package lsp-mode
  :ensure t
  :init
  (setq lsp-keymap-prefix "C-c l")
  :hook
  ((csharp-mode . lsp))
  :commands lsp)

(provide '_dotnet)
;;; _dotnet.el ends here

