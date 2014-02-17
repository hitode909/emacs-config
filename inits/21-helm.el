(require 'helm)
(require 'helm-config)

(defun my-helm-mini ()
  (interactive)
  (require 'helm-files)
  (helm-other-buffer '(
                       helm-source-buffers-list
                       helm-source-files-in-current-dir
                       helm-source-recentf
                       helm-source-file-cache
                       helm-source-locate
                       )
                     "*helm mini*"))

(global-set-key (kbd "C-;") 'my-helm-mini)
(global-set-key (kbd "M-x") 'helm-M-x)
(global-set-key (kbd "M-y") 'helm-show-kill-ring)
(define-key helm-map (kbd "C-h") 'delete-backward-char)

(require 'helm-c-moccur)
(global-set-key (kbd "C-o") 'helm-c-moccur-occur-by-moccur)

(setq helm-c-moccur-enable-initial-pattern t)


(global-set-key (kbd "M-i") 'helm-imenu)

(global-set-key [(super z)] 'helm-resume)

(global-set-key (kbd "C-x b") 'helm-buffers-list)
(global-set-key (kbd "C-x C-b") 'helm-buffers-list)

(global-set-key (kbd "M-.") 'helm-etags-select)
