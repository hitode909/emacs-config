(defun deferred:process-buffer-gen (f command args)
  "[internal]"
  (let ((d (deferred:next)) (uid (deferred:uid)))
    (lexical-let
        ((f f) (command command) (args args)
         (proc-name (format "*deferred:*%s*:%s" command uid))
         (buf-name (format " *deferred:*%s*:%s" command uid))
         (pwd default-directory)
         (nd (deferred:new)) proc-buf proc)
      (deferred:nextc d
        (lambda (x)
          (setq proc-buf (get-buffer-create buf-name))
          (condition-case err
              (let ((default-directory pwd))
                (setq proc
                      (if (null (car args))
                          (apply f proc-name buf-name command nil)
                        (apply f proc-name buf-name command args)))
                (set-process-sentinel
                 proc
                 (lambda (proc event)
                   (cond
                    ((string-match "exited abnormally" event)
                     (let ((msg (if (buffer-live-p proc-buf)
                                    (format "Process [%s] exited abnormally : %s"
                                            command
                                            (with-current-buffer proc-buf (buffer-string)))
                                  (concat "Process exited abnormally: " proc-name))))
                       (kill-buffer proc-buf)
                       (deferred:post-task nd 'ng msg)))
                    ((equal event "finished\n")
                       (deferred:post-task nd 'ok proc-buf)))))
                (setf (deferred-cancel nd) 
                      (lambda (x) (deferred:default-cancel x)
                        (when proc
                          (kill-process proc)
                          (kill-buffer proc-buf)))))
            (error (deferred:post-task nd 'ng (error-message-string err))))
          nil))
      nd)))
