(use-package lsp-java
  :ensure t
  :demand t
  :after lsp-mode
  :when (and openjdk-21-path
             (file-exists-p openjdk-21-path))
  :custom
  (lsp-java-java-path openjdk-21-path))

(use-package lsp-java
  :no-require
  :hook (java-mode . lsp))

(provide '_lsp-java)
