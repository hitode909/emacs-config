;; https://github.com/syohex/dot_files/blob/master/emacs/init_loader/02_helm.el
;; 対話的にやるところのデフォルト値など変更

(defun helm-myutils:git-topdir ()
  (file-name-as-directory
   (replace-regexp-in-string
    "\n" ""
    (shell-command-to-string "git rev-parse --show-toplevel"))))

(defun helm-myutils:git-grep-source ()
  `((name . ,(format "Grep at %s" default-directory))
    (init . helm-myutils:git-grep-init)
    (candidates-in-buffer)
    (type . file-line)))

(defun helm-myutils:git-grep-init-old ()
  (helm-attrset 'recenter t)
  (with-current-buffer (helm-candidate-buffer 'global)
    (let ((cmd (read-string "Grep: " "git grep -n ")))
      (call-process-shell-command cmd nil t))))

(defun helm-myutils:git-grep-init ()
  (helm-attrset 'recenter t)
  (let* (
         (default-word (or
                        (and mark-active (buffer-substring-no-properties (region-beginning) (region-end)))
                        (and (symbol-at-point) (symbol-name (symbol-at-point)))
                        ))
         (root (vc-git-root default-directory))
         (grep-dir (read-file-name
                    "In directory: " root root t))
         (grep-word (read-string
                     "Search for: "
                     default-word
                     'git-grep-history))
         (command (format "cd %s && git --no-pager grep --full-name --no-color -I -n -i -e %s"
                  grep-dir
                  (shell-quote-argument grep-word))))
    (with-current-buffer (helm-candidate-buffer 'global)
            (call-process-shell-command command nil t))))

;;;###autoload
(defun helm-myutils:git-grep ()
  (interactive)
  (let ((default-directory (vc-git-root default-directory)))
    (unless default-directory
      (error "I'm not in Git Repository!!"))
    (helm :sources (helm-myutils:git-grep-source) :buffer "*helm git*")))

(global-set-key [(super g)] 'helm-myutils:git-grep)
