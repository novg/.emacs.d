;;; init-helm.el

;;; Commentary:

;;; Code:
(helm-mode 1)

(global-set-key (kbd "M-x") 'helm-M-x)
(global-set-key (kbd "M-y") 'helm-show-kill-ring)
(global-set-key (kbd "C-x C-f") 'helm-find-files)
(global-set-key (kbd "C-c o") 'helm-occur)
(global-set-key (kbd "C-x b") 'helm-mini)
(global-set-key (kbd "C-h a") 'helm-apropos)
(global-set-key (kbd "C-h d") 'helm-info-at-point)
(global-set-key (kbd "C-c i") 'helm-imenu)

(provide 'init-helm)

;;; init-helm.el ends here
