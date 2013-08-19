(require 'yasnippet)
(yas-global-mode 1)

;; use "M-o" to expand, not "TAB"
(define-key yas-minor-mode-map (kbd "M-o") 'yas-expand)
(define-key yas-minor-mode-map (kbd "TAB") nil)
