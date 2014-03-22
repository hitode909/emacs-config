((ddskk-head status "installed" recipe
             (:name ddskk-head :website "http://openlab.ring.gr.jp/skk/ddskk.html" :description "A Japanese input method on Emacs." :type github :pkgname "hitode909/ddskk" :autoloads nil :info "doc/skk.info" :features
                    ("skk-setup")
                    :build
                    `((,el-get-emacs "-batch" "-q" "-no-site-file" "-l" "SKK-MK" "-f" "SKK-MK-compile")
                      (,el-get-emacs "-batch" "-q" "-no-site-file" "-l" "SKK-MK" "-f" "SKK-MK-compile-info")
                      ("cp" "skk-setup.el.in" "skk-setup.el"))))
 (dmacro status "installed" recipe
         (:name dmacro :type http :url "http://www.pitecan.com/DynamicMacro/dmacro.el"))
 (el-get status "installed" recipe
         (:name el-get :website "https://github.com/dimitri/el-get#readme" :description "Manage the external elisp bits and pieces you depend upon." :type github :branch "4.stable" :pkgname "dimitri/el-get" :features el-get :info "." :load "el-get.el"))
 (highlight-unique-symbol status "installed" recipe
                          (:name highlight-unique-symbol :type github :description "typo finder" :pkgname "hitode909/emacs-highlight-unique-symbol" :branch "master"))
 (inertial-scroll status "installed" recipe
                  (:name inertial-scroll :type github :description "inertial-scroll" :pkgname "kiwanami/emacs-inertial-scroll" :branch "master"))
 (mcomplete status "installed" recipe
            (:name mcomplete :type http :url "http://homepage1.nifty.com/bmonkey/emacs/elisp/mcomplete.el"))
 (open-github-from-here status "installed" recipe
                        (:name open-github-from-here :type github :description "open github from here" :pkgname "shibayu36/emacs-open-github-from-here" :branch "development"))
 (smartchr status "installed" recipe
           (:type github :username "emacsmirror" :name smartchr :type emacsmirror :features smartchr :description "Emacs version of smartchr.vim")))
