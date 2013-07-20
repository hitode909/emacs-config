;; Packages to install from ELPA and MELPA
(defvar my/packages
  '(
    init-loader
    )
  "A list of packages to install from MELPA at launch.")

;; Install Melpa packages
(dolist (package my/packages)
  (when (or (not (package-installed-p package)))
    (package-install package)))
