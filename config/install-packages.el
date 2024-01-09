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
  '(use-package))

;; Scan the list in my-packages
(mapc #'(lambda (package)
	  (unless (package-installed-p package)
	    (package-install package)))
      my-packages)

(require 'use-package)

(require 'install-solarized-theme)
(require 'install-better-defaults)
(require 'install-rainbow-delimiters)
(require 'install-ace-window)
(require 'install-helm)

(provide 'install-packages)
