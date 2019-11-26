;;; development.el --- Load All Development Configuration

;;; Commentary:

;;; Code:

;;(global-flycheck-mode)

(add-hook 'before-save-hook 'delete-trailing-whitespace)
;(add-hook 'prog-mode-hook 'flyspell-prog-mode)


(require '_python)
;; (require '_markdown)


(provide 'development)

;;; development.el ends here
