(when (require 'magit nil t)
  (global-unset-key "\C-xvd")
  (global-set-key [(super s)] 'magit-status)
  (global-set-key [(super l)] 'magit-log)
  )

(setq magit-save-some-buffers nil)

(setq magit-set-upstream-on-push t)

(set-face-inverse-video-p 'diff-added nil)
(set-face-inverse-video-p 'diff-removed nil)

(set-face-foreground 'magit-header "#586e75")
(set-face-background 'magit-header "#fdf6e3")

(add-hook 'magit-mode-hook
          '(lambda ()
             (local-unset-key (kbd "M-p"))))
