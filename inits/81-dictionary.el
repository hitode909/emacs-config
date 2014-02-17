(require 'cl)
(require 'deferred)

(defvar dict-bin "~/bin/dict"
  "dict 実行ファイルのパス")

(defun my-dictionary ()
  (interactive)
  (lexical-let ((current-word (thing-at-point 'word)))
    (when current-word
        (deferred:$
          (deferred:process dict-bin current-word)
          (deferred:nextc it
            (lambda (res) (popup-tip (concat current-word "\n" res))))))))

(global-set-key [(super d)] 'my-dictionary)

