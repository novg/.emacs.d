;;; Package --- Summary
;;; Commentary:
;;; Code:
(load (expand-file-name "~/.roswell/helper.el"))

(setq inferior-lisp-program "ros -Q run")

(require 'sly-autoloads)
(setq sly-complete-symbol-function 'sly-flex-completions)
(eval-after-load 'sly
  `(define-key sly-prefix-map (kbd "M-h") 'sly-documentation-lookup))

(provide '_cl)
;;; _cl.el ends here
