(setq el-get-dir "~/.emacs.d/elisp/el-get/")

(unless (require 'el-get nil 'noerror)
  (with-current-buffer
      (url-retrieve-synchronously
       "https://raw.github.com/dimitri/el-get/master/el-get-install.el")
    (goto-char (point-max))
    (eval-print-last-sexp)))

(setq el-get-sources
      '(
        (:name open-github-from-here
               :type github
               :description "open github from here"
               :pkgname "shibayu36/emacs-open-github-from-here"
               :branch "development")
        (:name inertial-scroll
               :type github
               :description "inertial-scroll"
               :pkgname "kiwanami/emacs-inertial-scroll"
               :branch "master")
        (:name dmacro
               :type http
               :url "http://www.pitecan.com/DynamicMacro/dmacro.el")
        ))

;; Packages to install from el-get
(defvar my/el-get-packages
  '(
    open-github-from-here
    dmacro
    smartchr
    inertial-scroll
    )
  "A list of packages to install from el-get at launch.")

(el-get 'sync my/el-get-packages)
