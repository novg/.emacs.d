(load (expand-file-name "~/.roswell/helper.el"))

(setq inferior-lisp-program "ros -Q run")

(eval-after-load 'sly
  `(define-key sly-prefix-map (kbd "M-h") 'sly-documentation-lookup))

(provide 'install-cl)
