;; emacs-serverを起動
(server-start)

(setq server-use-tcp t)

;; C-x kで終了
(add-hook 'server-switch-hook
          (lambda ()
            (when (current-local-map)
              (use-local-map (copy-keymap (current-local-map))))
            (local-set-key (kbd "C-x k") 'server-edit)))

(defun my-server-detach-buffer ()
  (interactive)
  (server-buffer-done (current-buffer) t)
  (message "Detached")
  )
(global-set-key [(super z)] 'my-server-detach-buffer)


