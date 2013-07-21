;; Packages to install from ELPA and MELPA
(setq my/packages
  '(
    init-loader
    popwin
    expand-region
    wgrep
    undo-tree
    zlc
    expand-region
    deferred
    auto-complete
    helm
    auto-save-buffers-enhanced
    magit
    color-theme
    color-theme-solarized
    perlbrew
    flymake
    zencoding-mode
    yasnippet
    elscreen
    jaunte
    ))

;; (package-refresh-contents)

;; Install Melpa packages
(dolist (package my/packages)
  (when (or (not (package-installed-p package)))
    (package-install package)))
