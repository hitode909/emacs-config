(require 'flycheck)

(add-hook 'after-init-hook #'global-flycheck-mode)

(eval-after-load 'flycheck
  '(custom-set-variables
    '(flycheck-display-errors-function #'flycheck-pos-tip-error-messages)))

;; (require 'flycheck-color-mode-line)
;; (eval-after-load "flycheck"
;;   '(add-hook 'flycheck-mode-hook 'flycheck-color-mode-line-mode))

(add-hook
 'flycheck-mode-hook
 '(lambda ()
    (local-set-key [(super e)] 'flycheck-next-error)
    ))

;; elispのpackage書いてとか怒られるのでやめる
(setq-default flycheck-disabled-checkers '(emacs-lisp-checkdoc))

;; disable jshint since we prefer eslint checking
(setq-default flycheck-disabled-checkers
  (append flycheck-disabled-checkers
    '(javascript-jshint)))

;; use eslint with web-mode for jsx files
(flycheck-add-mode 'javascript-eslint 'web-mode)

;; disable json-jsonlist checking for json files
(setq-default flycheck-disabled-checkers
  (append flycheck-disabled-checkers
    '(json-jsonlist)))
