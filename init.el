;;; init.el --- Custom Emacs Configuration

;;; Commentary:

;;; Code:

;; (package-initialize)

;; Directory with local Emacs lisp files
;; (let ((path (expand-file-name "~/.emacs.d/lisp/")))
;;   (if (file-accessible-directory-p path)
;;       (add-to-list 'load-path path)))
(let ((default-directory "~/.emacs.d/"))
  (normal-top-level-add-subdirs-to-load-path))

(setq default-directory (concat (getenv "HOME") "\\"))

(require 'install-packages)
(require 'better-defaults)

;; BASIC CUSTOMIZATION
;; -------------------------------------
(setq inhibit-startup-message t
      linum-format "%4d \u2502 "
      backup-directory-alist `((".*" . ,temporary-file-directory))
      auto-save-file-name-transforms `((".*" ,temporary-file-directory t))
      frame-title-format "GNU Emacs: %b" ;; Display the name of the current buffer in the title bar
      tooltip-mode  0
      column-number-mode t  ;; show number of column at mode-line
      scroll-step               1
      scroll-margin             5
      scroll-conservatively 10000
      ring-bell-function 'ignore
      custom-file "~/.emacs.d/custom.el")

(global-linum-mode  t)    ;; show nubers of strings at all buffers

;; (setq-default indicate-empty-lines t)
;; (setq-default indicate-buffer-boundaries 'left)
(defalias 'yes-or-no-p 'y-or-n-p)
(global-hl-line-mode t) ;; Highlight current line

(defun my-make-frame-function(frame)
  "Auxilary func for reset FRAME."
  (if (not (featurep 'powerline))
      (powerline-center-theme)))

(when window-system
  (my-make-frame-function (selected-frame))
  (set-frame-size (selected-frame) 150 36)
  (set-frame-position (selected-frame) 40 10)
  (load-theme 'solarized-light t)
;; (set-frame-font (format "DejaVu Sans Mono:pixelsize=%d:antialias:true:autohint=true" 14)))
  (set-frame-font (format "Consolas:pixelsize=%d:antialias:true:autohint=true" 22)))

(require 'powerline)
(powerline-center-theme)

(setq my-dark-theme 'material
      my-light-theme 'solarized-light)

(defun my-light-theme ()
  "Switch to light theme."
  (interactive)
  (mapc #'disable-theme custom-enabled-themes)
  (when (load-theme my-light-theme t)
  (powerline-reset)))

(defun my-dark-theme ()
  "Switch to dark theme."
  (interactive)
  (mapc #'disable-theme custom-enabled-themes)
  (when (load-theme my-dark-theme t)
    (powerline-reset)))

(add-hook 'after-make-frame-functions
          #'my-make-frame-function)

;; (require 'whitespace)
;; (setq whitespace-line-column 80) ;; limit line length
;; (setq whitespace-style '(face lines-tail))
;; (add-hook 'prog-mode-hook 'whitespace-mode)

;; make it delete trailing whitespace
(add-hook 'before-save-hook 'delete-trailing-whitespace)

;; Enable paredit mode
(autoload 'enable-paredit-mode "paredit" "Turn on pseudo-structural editing of Lisp code." t)
(add-hook 'emacs-lisp-mode-hook       #'enable-paredit-mode)
(add-hook 'eval-expression-minibuffer-setup-hook #'enable-paredit-mode)
(add-hook 'ielm-mode-hook             #'enable-paredit-mode)
(add-hook 'lisp-mode-hook             #'enable-paredit-mode)
(add-hook 'lisp-interaction-mode-hook #'enable-paredit-mode)
(add-hook 'scheme-mode-hook           #'enable-paredit-mode)
(add-hook 'clojure-mode-hook          #'enable-paredit-mode)


;; Enable projectile
;(projectile-mode +1)
;(define-key projectile-mode-map (kbd "s-p") 'projectile-command-map)
;(define-key projectile-mode-map (kbd "C-c p") 'projectile-command-map)


;;
;; CONVENIENCE FUNCTIONS, ALIASES, AND KEY BINDINGS
;;

(add-to-list 'auto-mode-alist '("\\.http\\'" . restclient-mode))

(require 'init-helm)
(require 'development)
(require 'keybindings)

(load custom-file)

(put 'upcase-region 'disabled nil)

;; ORG-MODE
;; Time mark for task closing
(setq org-log-done t)
(add-hook 'org-mode-hook (lambda () (linum-mode 0)))


;;; init.el ends here
