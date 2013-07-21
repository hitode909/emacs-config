(defun git-grep (grep-dir grep-word)
  (interactive
   (let (
         (root (vc-git-root default-directory))
         (default-word (or
                        (and mark-active (buffer-substring-no-properties (region-beginning) (region-end)))
                        (and (symbol-at-point) (symbol-name (symbol-at-point)))
                        ))
         )
     (list
      (read-file-name
       "In directory: " root root t)
      (read-shell-command
       "Search for: "
       default-word
       'git-grep-history))))
  (let ((grep-use-null-device nil)
        (command
         (format "cd %s && git --no-pager grep --no-color -I -n -i -e %s"
                 grep-dir
                 (shell-quote-argument grep-word))))
    (grep command)))

(global-set-key [(super g)] 'git-grep)
