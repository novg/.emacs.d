;;; init-helm.el

;;; Commentary:

;;; Code:
(use-package helm
  :ensure t
  :bind (("M-x" . helm-M-x)
         ("M-y" . helm-show-kill-ring)
         ("C-x C-f" . helm-find-files)
         ("C-x b" . helm-mini)
         ("C-x C-d" . helm-browse-project))
  :config  (helm-mode 1)
           (setq helm-M-x-fuzzy-match 1)
           (setq helm-buffers-fuzzy-matching 1)
           (setq helm-recentf-fuzzy-match 1)
  )

;; (global-set-key (kbd "M-x") 'helm-M-x)
;; (global-set-key (kbd "M-y") 'helm-show-kill-ring)
;; (global-set-key (kbd "C-x C-f") 'helm-find-files)
;; (global-set-key (kbd "C-c o") 'helm-occur)
;; (global-set-key (kbd "C-x b") 'helm-mini)
;; (global-set-key (kbd "C-h a") 'helm-apropos)
;; (global-set-key (kbd "C-h d") 'helm-info-at-point)
;; (global-set-key (kbd "C-c i") 'helm-imenu)

(provide 'install-helm)

;;; init-helm.el ends here
