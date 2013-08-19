(when (require 'coffee-mode nil t)
  (defun coffee-custom ()
    "coffee-mode-hook"
    (set (make-local-variable 'tab-width) 2)
    (setq coffee-cleanup-whitespace nil)
    (define-key coffee-mode-map [(meta R)] 'coffee-compile-file)

    ;; (add-hook 'after-save-hook
    ;;           '(lambda ()
    ;;              (when (string-match "\.coffee" (buffer-name)) ; ~~~.coffee<>
    ;;                (coffee-compile-file))))
    )

  (add-hook 'coffee-mode-hook
            '(lambda() (coffee-custom)))

  (add-to-list 'auto-mode-alist '("\\.js.shd$" . coffee-mode))


  (setq coffee-args-compile '("-cb"))
  (setq ac-modes (cons 'coffee-mode ac-modes))
  )
