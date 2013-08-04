;; http://d.hatena.ne.jp/syohex/20120718/1342620627
;; XXX: should use el-get or something

(require 'cl)
(require 'helm-config)
(require 'helm-files)

;; https://github.com/syohex/dot_files/blob/master/emacs/init_loader/02_helm.el
(defun helm-myutils:git-project-source (pwd)
  (loop for (description . option) in
        '(("Modified files" . "--modified")
          ("Untracked files" . "--others --exclude-standard")
          ("All controlled files in this project" . ""))
        for cmd = (format "git ls-files %s" option)
        collect
        `((name . ,(format "%s [%s]" description pwd))
          (init . (lambda ()
                    (with-current-buffer (helm-candidate-buffer 'global)
                      (call-process-shell-command ,cmd nil t))))
          (candidates-in-buffer)
          (action . (("Open File" . find-file)
                     ("Open File other window" . find-file-other-window)
                     ("Insert buffer" . insert-file))))))

(defun helm-myutils:git-topdir ()
  (file-name-as-directory
   (replace-regexp-in-string
    "\n" ""
    (shell-command-to-string "git rev-parse --show-toplevel"))))

;;;###autoload
(defun helm-myutils:git-project ()
  (interactive)
  (let ((topdir (vc-git-root default-directory)))
    (unless topdir
      (error "I'm not in Git Repository!!"))
    (let ((default-directory topdir)
          (sources (helm-myutils:git-project-source
                    (file-name-nondirectory
                     (directory-file-name topdir)))))
      (helm-other-buffer sources "*helm git project*"))))

(define-key global-map (kbd "M-p") 'helm-myutils:git-project)

