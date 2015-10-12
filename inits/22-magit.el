(setq magit-last-seen-setup-instructions "1.4.0")

(when (require 'magit nil t)
  (global-unset-key "\C-xvd")
  (global-set-key [(super s)] 'magit-status)
  (global-set-key [(super l)] 'magit-log)
  )


(add-hook 'magit-mode-hook
          '(lambda ()
             (local-unset-key (kbd "M-p"))))

(setq magit-revert-buffers nil)

(setq magit-push-always-verify 'PP)

(setq magit-branch-arguments nil)
(setq magit-push-arguments '("--set-upstream"))

(setq magit-save-some-buffers nil)
