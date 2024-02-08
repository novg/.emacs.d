;;; package --- Summary
;;; Commentary:
;;; Code:

;; add descendant directories to 'load-path'
(let ((default-directory "~/.emacs.d/"))
  (normal-top-level-add-subdirs-to-load-path))

(if (eq system-type 'windows-nt)
    (setq default-directory (concat (getenv "HOME") "\\")))

(when window-system
  (set-frame-size (selected-frame) 160 35))

(setq inhibit-startup-screen t) ;; disable startup screen
(tool-bar-mode -1) ;; disable tool bar
(menu-bar-mode -1) ;; disable menu bar
(scroll-bar-mode -1) ;; disable scroll bar
(setq frame-title-format "GNU Emacs: %b")
(setq ring-bell-function 'ignore)
(defalias 'yes-or-no-p 'y-or-n-p)

(setq backup-directory-alist `((".*" . ,temporary-file-directory))
      auto-save-file-name-transforms `((".*" ,temporary-file-directory t)))

(setq scroll-step 1
      scroll-margin 3
      scroll-conservatively 10000)

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
(global-set-key (kbd "<f6>") 'toggle-truncate-lines)
(global-set-key (kbd "M-i" ) 'imenu)
(global-set-key (kbd "M-S-z") 'zap-up-to-char)
(global-set-key (kbd "C-;") 'comment-line)

(add-hook 'before-save-hook
          (when '(not fundamental-mode))
          'delete-trailing-whitespace)

;; (global-set-key [remap dabbrev-expand] 'hippie-expand)
;; Disabable expanding a word into a line or a blob of long text
;; Note: order matters:
(setq hippie-expand-try-functions-list
      '(
        try-expand-dabbrev
        try-expand-dabbrev-all-buffers
        ;; try-expand-dabbrev-from-kill
        try-complete-lisp-symbol-partially
        try-complete-lisp-symbol
        try-complete-file-name-partially
        try-complete-file-name
        ;; try-expand-all-abbrevs
        ;; try-expand-list
        ;; try-expand-line
        ))

(defun sudo ()
  "Use TRAMP to `sudo` the current buffer."
  (interactive)
  (when buffer-file-name
    (find-alternate-file
     (concat "/sudo:root@localhost:"
	     buffer-file-name))))

(require 'dired-x)

;; Centralized location where emacs will leave its temporary files
(setq temporary-file-directory "~/.emacs.d/saves")
 (setq backup-directory-alist
	`((".*" . ,temporary-file-directory)))
 (setq auto-save-file-name-transforms
	`((".*" ,temporary-file-directory t)))

 (message "Deleting old backup files...")
 (let ((week (* 60 60 24 7))
	(current (float-time (current-time))))
   (dolist (file (directory-files temporary-file-directory t))
     (when (and (backup-file-name-p file)
		 (> (- current (float-time (nth 5 (file-attributes file))))
		    week))
	(message "%s" file)
	(delete-file file))))
;;

(require '_packages)
(require '_development)

(setq custom-file "~/.emacs.d/custom.el")
(load custom-file)
;;; init.el ends here
