;;; init.el --- Custom Emacs Configuration

;;; Commentary:

;;; Code:

(package-initialize)

;; Directory with local Emacs lisp files
;; (let ((path (expand-file-name "~/.emacs.d/lisp/")))
;;   (if (file-accessible-directory-p path)
;;       (add-to-list 'load-path path)))
(let ((default-directory "~/.emacs.d/"))
    (normal-top-level-add-subdirs-to-load-path))


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
      custom-file "~/.emacs.d/custom.el"
      )

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
  (set-frame-size (selected-frame) 160 42)
  (set-frame-position (selected-frame) 130 10)
  (load-theme 'material t)
  (set-frame-font (format "DejaVu Sans Mono:pixelsize=%d:antialias:true:autohint=true" 17)))

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
(projectile-mode +1)
(define-key projectile-mode-map (kbd "s-p") 'projectile-command-map)
(define-key projectile-mode-map (kbd "C-c p") 'projectile-command-map)


;;
;; CONVENIENCE FUNCTIONS, ALIASES, AND KEY BINDINGS
;;


;; Auto-complete
(global-set-key (kbd "S-SPC") 'dabbrev-expand)

(defun copy-line (arg)
  "Copy lines (as many as prefix ARG) in the kill ring."
  (interactive "p")
  (kill-ring-save (line-beginning-position)
                  (line-beginning-position (+ 1 arg)))
  (message "%d line%s copied" arg (if (= 1 arg) "" "s")))
(global-set-key "\C-c\C-y" 'copy-line)

(global-set-key (kbd "C-;") 'comment-line)


(defun backward-kill-word-or-kill-region (arg)
  "Delete previous word (ARG) or region."
  (interactive "p")
  (if (region-active-p)
      (kill-region (region-beginning)
                   (region-end))
    (backward-kill-word arg)))
(global-set-key (kbd "C-w") 'backward-kill-word-or-kill-region)
(define-key minibuffer-local-map (kbd "C-w") 'backward-kill-word-or-kill-region)
(add-hook 'ido-setup-hook
          (lambda ()
            (define-key ido-completion-map (kbd "C-w") 'ido-delete-backward-word-updir)))

(defun kill-current-buffer ()
  "Killing current buffer."
  (interactive)
  (kill-buffer (current-buffer)))
(global-set-key (kbd "C-x C-k") 'kill-current-buffer)

(defun create-new-line-with-indent ()
  "Create new line with indent from middle line."
  (interactive)
  (end-of-line 1)
  (newline-and-indent))
(global-set-key (kbd "<C-return>") 'create-new-line-with-indent)

(defun move-line-down ()
  "Move current line down."
  (interactive)
  (let ((col (current-column)))
    (save-excursion
      (forward-line)
      (transpose-lines 1))
    (forward-line)
    (move-to-column col)))
(global-set-key (kbd "<M-down>") 'move-line-down)

(defun move-line-up ()
  "Move current line up."
  (interactive)
  (let ((col (current-column)))
    (save-excursion
      (forward-line)
      (transpose-lines -1))
    (previous-line 2)
    (move-to-column col)))
(global-set-key (kbd "<M-up>") 'move-line-up)

(add-to-list 'auto-mode-alist '("\\.http\\'" . restclient-mode))


(require 'init-helm)
(require 'development)

(load custom-file)

;;; init.el ends here
(put 'upcase-region 'disabled nil)
