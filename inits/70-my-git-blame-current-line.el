(require 'deferred)

(defun git-blame-current-line ()
  (interactive)
  (lexical-let*
      (
       (buffer-name (buffer-file-name (current-buffer)))
       (line-num (line-number-at-pos))
       )
    (deferred:$
      (deferred:process-shell (format "git-blame-oneline %s %d" buffer-name line-num))
      (deferred:nextc it
        (lambda (res)
          (popup-tip res)))
      )
    ))

(global-set-key [(super b)] 'git-blame-current-line)
