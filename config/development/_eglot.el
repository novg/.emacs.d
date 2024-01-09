(use-package eglot
  :ensure t
  :commands (eglot eglot-ensure)
  :hook ((csharp-mode . eglot-ensure))
  :config
  (add-to-list 'eglot-server-programs
               '(csharp-mode . ("csharp-ls"))))

(use-package company
  :ensure t
  :config
  (global-company-mode))

(use-package csharp-mode
  :ensure t)

(provide '_eglot)
