(defun helm-highlight-buffers (buffers sources)
  "helm-highlight-buffersのファイルサイズとか消してフルパス表示する版"
  (loop for i in buffers
        for buf = (get-buffer i)
        for proc = (get-buffer-process buf)
        for bufname = (or (buffer-file-name buf) (format "%s" buf))
        for directory = (rassoc buf dired-buffers)
        collect
        (cond (directory
               (cons (propertize (car directory) 'face 'helm-ff-directory) i))
              ((file-exists-p bufname)
               (cons (propertize bufname 'face 'helm-ff-file) i))
              (t
               (cons (propertize bufname 'face 'italic) i))
              )))
