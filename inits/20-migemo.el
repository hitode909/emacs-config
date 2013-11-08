(when (and (executable-find "cmigemo")
           (require 'migemo nil t))
  (setq migemo-options '("-q" "--emacs"))

  (setq migemo-command "/Users/hitode909/homebrew/bin/cmigemo")
  (setq migemo-dictionary "/Users/hitode909/homebrew/share/migemo/utf-8/migemo-dict")

  (setq migemo-user-dictionary nil)
  (setq migemo-regex-dictionary nil)
  (setq migemo-coding-system 'utf-8-unix)
  (load-library "migemo")
  (migemo-init)

  (setq migemo-isearch-enable-p t)
)
