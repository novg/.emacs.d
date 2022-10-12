;; add descendant directories to 'load-path'
(let ((default-directory "~/.emacs.d/"))
  (normal-top-level-add-subdirs-to-load-path))

(if (eq system-type 'windows-nt)
    (setq default-directory (concat (getenv "HOME") "\\")))

(setq inhibit-startup-screen t) ;; disable startup screen
(tool-bar-mode -1) ;; disable tool bar
(menu-bar-mode -1) ;; disable menu bar
(scroll-bar-mode -1) ;; disable scroll bar
(setq frame-title-format "GNU Emacs: %b")
(setq ring-bell-function 'ignore)

(setq backup-directory-alist `((".*" . ,temporary-file-directory))     
      auto-save-file-name-transforms `((".*" ,temporary-file-directory t)))

(setq scroll-step 1
      scroll-margin 3
      scroll-conservatively 10000)

;; (setq indent-tabs-mode nil)
;; (setq tab-width 8)

(setq apropos-sort-by-scores t)

;; show line numbers
(global-display-line-numbers-mode)
(setq display-line-numbers-type 'relative)
(column-number-mode)
(global-hl-line-mode t) ;; Highlight current line

;; windows management
(setq winner-mode t) ;; undo/redo windows splitting
(windmove-default-keybindings) ;; switch windows <S-arrow>
(global-set-key (kbd "M-o") 'other-window) ;; switch windows instead "C-x o"

;; key bindings
(global-set-key [remap list-buffers] 'ibuffer)
(global-set-key (kbd "<f6>") 'toggle-truncate-lines) ;; toggle word wrapping
(global-set-key (kbd "M-i" ) 'imenu)
(global-set-key [remap dabbrev-expand] 'hippie-expand)
(global-set-key (kbd "M-S-z") 'zap-up-to-char)
(global-set-key (kbd "C-;") 'comment-line)

(defun backward-kill-word-or-kill-region (arg)
  "C-w delete previous word or region"
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

(defun sudo ()
  "Use TRAMP to `sudo` the current buffer."
  (interactive)
  (when buffer-file-name
    (find-alternate-file
     (concat "/sudo:root@localhost:"
	     buffer-file-name))))

(require 'install-packages)
(require 'init-helm)
(require 'development)

(setq custom-file "~/.emacs.d/custom.el")
(load custom-file)
