(require 'web-mode)

(setq web-mode-code-indent-offset 4)

(setq auto-mode-alist (cons '("/components/.+\\.js$" . web-mode) auto-mode-alist))

(add-hook 'web-mode-hook
          '(lambda ()
             ;; helmの起動とバッティングしてるので消す
             (local-unset-key (kbd "C-;"))
             ))
