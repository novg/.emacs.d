;;; development.el --- Load All Development Configuration

;;; Commentary:

;;; Code:


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

(global-set-key (kbd "C-/") 'comment-line)


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


(provide 'keybindings)

;;; keybindings.el ends here
