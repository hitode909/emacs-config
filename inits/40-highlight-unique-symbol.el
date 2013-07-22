(require 'highlight-unique-symbol)
(highlight-unique-symbol t)
; (setq highlight-unique-symbol:interval 0.05)

; (add-hook 'post-command-hook 'highlight-unique-symbol:check)
; (remove-hook 'post-command-hook 'highlight-unique-symbol:check)

(set-face-foreground 'highlight-unique-symbol:face nil)
(set-face-underline  'highlight-unique-symbol:face nil)
(set-face-background 'highlight-unique-symbol:face "#e7e4ff")
