(when window-system

  ;; スクロールバーを隠す
  (scroll-bar-mode -1)
  ;; ツールバーを隠す
  (tool-bar-mode 0)
  ;; 左右の余白消す
  (fringe-mode 0)

  (set-face-attribute 'default nil
		      :family "Monaco"
		      :height 120)
  (set-fontset-font "fontset-default"
		    'japanese-jisx0208
		    '("Osaka" . "iso10646-1"))
  (set-fontset-font "fontset-default"
		    'katakana-jisx0201
		    '("Osaka" . "iso10646-1"))
  (setq face-font-rescale-alist
	'((".*Monaco-bold.*" . 1.0)
	  (".*Monaco-medium.*" . 1.0)
	  (".*Osaka-bold.*" . 1.2)
	  (".*Osaka-medium.*" . 1.2)
	  ("-cdac$" . 1.4)))

  (setq mac-option-modifier 'meta)
  (setq mac-command-key-is-meta t)
  (setq mac-command-modifier-meta t)
  (setq grep-find-use-xargs 'bsd)

  ;; fullscreenのときメニューバー隠す
  (setq mac-autohide-menubar-on-maximize t)

  ;; コントロールキーをシステムに取られないようにする
  (setq mac-pass-control-to-system nil)
  (setq mac-pass-command-to-system nil)
  (setq mac-pass-option-to-system nil)

  (setq ns-use-native-fullscreen nil)
  )
