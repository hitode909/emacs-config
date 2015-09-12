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
        (:name smartchr
               :type github
               :description "smartchr"
               :pkgname "imakado/emacs-smartchr"
               :branch "master")
        (:name auto-programing
               :type github
               :description "auto programming"
               :pkgname "hitode909/emacs-auto-programming"
               :branch "master")
        (:name highlight-unique-symbol
               :type github
               :description "typo finder"
               :pkgname "hitode909/emacs-highlight-unique-symbol"
               :branch "master"
               )
        (:name inertial-scroll
               :type github
               :description "inertial-scroll"
               :pkgname "kiwanami/emacs-inertial-scroll"
               :branch "master")
        (:name dmacro
               :type http
               :url "http://www.pitecan.com/DynamicMacro/dmacro.el")

	;; XXX: https://github.com/dimitri/el-get/issues/1247 がまだマージされてない CVSでのcheckoutに失敗した githubにforkしてインストール mvをcpにした
	(:name ddskk-head
	       :website "http://openlab.ring.gr.jp/skk/ddskk.html"
	       :description "A Japanese input method on Emacs."
	       :type github
	       :pkgname "hitode909/ddskk"
	       :autoloads nil
	       :info "doc/skk.info"
	       :features ("skk-setup")
	       ;; The "correct" way would be actually installing ddskk into some subdirectory.
	       ;; But it needs significant work due to the limitation of the Makefile
	       ;; thus here we are trying to emulate the Makefile behaviour.
	       :build `((,el-get-emacs "-batch" "-q" "-no-site-file" "-l" "SKK-MK" "-f" "SKK-MK-compile")
			(,el-get-emacs "-batch" "-q" "-no-site-file" "-l" "SKK-MK" "-f" "SKK-MK-compile-info")
			("cp" "skk-setup.el.in" "skk-setup.el")))
        ))

;; Packages to install from el-get
(setq my/el-get-packages
  '(
    open-github-from-here
    dmacro
    smartchr
    inertial-scroll
    ddskk-head
    highlight-unique-symbol
    auto-programing
    ))

(el-get 'sync my/el-get-packages)
