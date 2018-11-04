;; init-helm.el -- custom python configuration

;;; Commentary:

;;; Code:

(require 'helm)
(require 'helm-config)

(global-set-key (kbd "M-x") #'helm-M-x)
(global-set-key (kbd "M-y") #'helm-show-kill-ring)
(global-set-key (kbd "C-x C-f") #'helm-find-files)
(global-set-key (kbd "C-x r b") #'helm-filtered-bookmarks)
(global-set-key (kbd "C-c o") #'helm-occur)
(global-set-key (kbd "C-x b") #'helm-mini)
(global-set-key (kbd "C-h a") #'helm-apropos)
(global-set-key (kbd "C-h d") #'helm-info-at-point)
(global-set-key (kbd "C-c L") #'helm-locate)
(global-set-key (kbd "C-c r") #'helm-resume)
(global-set-key (kbd "C-c i") #'helm-imenu)

(helm-mode 1)

(require 'helm-descbinds)
(helm-descbinds-mode)  ; C-h b

(provide 'init-helm)

;;; init-helm.el ends here
