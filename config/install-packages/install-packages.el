;;; install-packages.el --- Emacs Package Installation

;;; Commentary:

;;; Code:

(require 'package)

(defvar my-packages
  '(better-defaults
    powerline
    helm
    helm-descbinds
    elpy
    flycheck
    py-autopep8
    solarized-theme
    material-theme
    magit
    ))

(add-to-list 'package-archives
             '("melpa" . "http://melpa.org/packages/") t)

(when (not package-archive-contents)
  (package-refresh-contents))
(package-initialize)

(dolist (p my-packages)
  (when (not (package-installed-p p))
    (package-install p)))

(provide 'install-packages)

;;; install-packages.el ends here
