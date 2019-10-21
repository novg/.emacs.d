;;; install-packages.el --- Emacs Package Installation

;;; Commentary:

;;; Code:

;; Enables basic packaging support
(require 'package)


;; Add the Melpa archive to the list of avilable repositories
(add-to-list 'package-archives
             '("melpa" . "http://melpa.org/packages/") t)

;; Initializes tha packages infrasturcture
(package-initialize)

;; If there are no archived package contents, refresh them
(when (not package-archive-contents)
  (package-refresh-contents))


;; Installs packages
;;
;; my-packages contains a list of package names
(defvar my-packages
  '(better-defaults        ;; Set up better Emacs defaults
    powerline
    helm                   ;; Emacs incremental completion and selection narrowing framework
    helm-descbinds         ;; A helm frontend for describe-bindings
    elpy                   ;; Emasc Lisp Python Environment
    flycheck               ;; On the fly suntax checker
    py-autopep8            ;; Run autopep8 on save
    blacken                ;; Black formatting on save
    magit                  ;; Git integration
    cider                  ;; Support for interactive programming in Clojure
    solarized-theme        ;; Theme
    material-theme         ;; Theme
    paredit                ;; Minor mode for performing structured editing of
    ))

;; Scan the list in my-packages
(mapc #'(lambda (package)
	  (unless (package-installed-p package)
	    (package-install package)))
      my-packages)


(provide 'install-packages)

;;; install-packages.el ends here
