(require 'popwin)
(setq display-buffer-function 'popwin:display-buffer)
(setq popwin:popup-window-height 0.5)

(push '("helm" :regexp t :height 0.5) popwin:special-display-config)
(push '("*magit-edit-log*" :height 0.5) popwin:special-display-config)
(push '("*Backtrace*" :noselect t :height 0.5) popwin:special-display-config)
(push '("*undo-tree*" :height 0.5) popwin:special-display-config)
(push '("*Shell Command Output*" :noselect t :height 0.5) popwin:special-display-config)