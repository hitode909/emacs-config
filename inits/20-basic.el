;; h
;; ;; default encodingをutf-8に変更
;; (set-default-coding-systems 'utf-8)

;; ;; 日本語
;; (setq current-language-environment "Japanese")

(when nil
  ;; color-theme
  (require 'color-theme)
  (require 'color-theme-solarized)
  (color-theme-solarized-light)
  (set-face-background 'header-line "#586e75")
  (set-face-foreground 'header-line "#fdf6e3")
  (set-face-bold-p 'header-line t)
)

;; 行間
(setq-default line-spacing 0.1)

;; status-barにカーソルのcolumn表示(4,29とか)
(column-number-mode t)

;; ファイル名補完で大文字小文字を区別しない
(setq completion-ignore-case t)

;; バックアップファイルを作らない
(setq make-backup-files nil)

;; ソースコードに色を付ける
(global-font-lock-mode t)

(setq-default indent-tabs-mode nil)


;; 起動時のメッセージを表示しない
(setq inhibit-startup-message t)

;; カーソル
(set-cursor-color "orange")
(blink-cursor-mode 0)


;; リージョンをC-hで削除
(delete-selection-mode 1)

;; kill-lineで行末の改行文字も削除
(setq kill-whole-line t)

(when nil
  ;; M-x補完，高機能なやつ
  (require 'mcomplete)
  (turn-on-mcomplete-mode)

  ;; mcomplete 色ましに
  (set-face-foreground 'mcomplete-prefix-method-fixed-part-face nil)
  (set-face-foreground 'mcomplete-prefix-method-alternative-part-face nil)
  (set-face-foreground 'mcomplete-substr-method-alternative-part-face nil)
  (set-face-foreground 'mcomplete-substr-method-fixed-part-face nil)
  )
;; regionに色を付ける
(transient-mark-mode t)

;;カーソルを前回編集していた位置に戻す
(load "saveplace")
(setq-default save-place t)


;; 補完してbuffer切替
(iswitchb-mode 1)

;; 対応する括弧を光らせる
(show-paren-mode 1)
(setq show-paren-delay 0)
(setq show-paren-style 'expression)
(set-face-attribute 'show-paren-match-face nil
                    :background "#eee8d5" :foreground nil
                    :underline nil :weight 'normal)

;; 画面チカチカさせない
(setq visible-bell nil)
(setq ring-bell-function 'ignore)

;;; status-barに時間表示
(setq display-time-24hr-format t)
(setq display-time-day-and-date t)
(setq display-time-string-forms
      '(month "/" day " " 24-hours ":" minutes " "))
(display-time-mode 1)

;;; カーソルがある行にアンダーラインを表示
;;(global-hl-line-mode)
;;(setq hl-line-face 'underline)
;;(hl-line-mode 1)

;;; yes-noをy-nに置き換え
(fset 'yes-or-no-p 'y-or-n-p)

;; 画面外の文字は折り返しして表示
(setq truncate-lines t)
(setq truncate-partial-width-windows nil)

;; Shebangがあるとき自動的にchmod +xする
(add-hook 'after-save-hook
          'executable-make-buffer-file-executable-if-script-p)

;; C-mで改行してインデント
(global-set-key "\C-m" 'newline-and-indent)

(when nil
  (autoload 'save-current-configuration "revive" "Save status" t)
  (autoload 'resume "revive" "Resume Emacs" t)
  (autoload 'wipe "revive" "Wipe emacs" t)
  (define-key ctl-x-map "R" 'resume)                        ;; C-x R で復元
  (define-key ctl-x-map "K" 'wipe)                          ;; C-x K で kill-emacs
  ;;  (add-hook 'kill-emacs-hook 'save-current-configuration)   ;; 終了時に保存
)

(global-set-key "\C-x\C-r" 'revert-buffer)

;; (require 'auto-install)
; (auto-install-update-emacswiki-package-name t)

; (require 'anything-timers)

;; 行末の変なスペース強調
(when (boundp 'show-trailing-whitespace)
  (setq-default show-trailing-whitespace t))

;; emacs終了時に確認メッセージを出す。
;; 誤って終了してしまわないようにするため
;; ref: http://blog.livedoor.jp/techblog/archives/64599359.html
(defadvice save-buffers-kill-emacs
  (before safe-save-buffers-kill-emacs activate)
  "safe-save-buffers-kill-emacs"
  (unless (y-or-n-p "Really exit emacs? ")
    (keyboard-quit)))

;;; メモを取る
(defun my-autonamed-txt()
  (interactive)
  (find-file
   (concat "~/Dropbox/memo/" (format-time-string "%Y%m%d") (system-name) ".txt"))
  )
(global-set-key [(super f)] 'my-autonamed-txt)

(defun my-insert-time ()
  (interactive)
  (insert (concat "* " (current-time-string) "\n" ))
  )
(global-set-key [(super r)] 'my-insert-time)

(defun my-insert-time2 ()
  (interactive)
  (insert (concat "** " (current-time-string) "\n" ))
  )
(global-set-key [(super R)] 'my-insert-time2)

;; recentf
(setq recentf-auto-cleanup 'never)
(recentf-mode 1)
(setq recentf-max-saved-items 10000000)

;; which-func
(require 'which-func)
(which-func-mode t)
;; 24
; (setq which-func-modes (append which-func-modes '(ruby-mode javascript-mode)))

(setq which-func-modes t)


;;battery
(display-battery-mode t)

(setq auto-mode-alist
      (append '(("\\.xhtml$" . html-mode)) auto-mode-alist))
(setq auto-mode-alist
      (append '(("\\.tt$" . html-mode)) auto-mode-alist))
(setq auto-mode-alist
      (append '(("\\.erb$" . html-mode)) auto-mode-alist))

;; yank した文字列をハイライト表示
(when window-system
  (defadvice yank (after ys:highlight-string activate)
    (let ((ol (make-overlay (mark t) (point))))
      (overlay-put ol 'face 'highlight)
      (sit-for 0.5)
      (delete-overlay ol)))
  (defadvice yank-pop (after ys:highlight-string activate)
    (when (eq last-command 'yank)
      (let ((ol (make-overlay (mark t) (point))))
	(overlay-put ol 'face 'highlight)
	(sit-for 0.5)
	(delete-overlay ol)))))


(auto-compression-mode t)

;;<1>をディレクトリ名にする
(require 'uniquify)
(setq uniquify-buffer-name-style 'forward)
;; (setq uniquify-buffer-name-style 'post-forward-angle-brackets)
(setq uniquify-min-dir-content 1)


;;C-Fで右のバッファ
(setq windmove-wrap-around t)
(define-key global-map [(C shift n)] 'windmove-down)
(define-key global-map [(C shift p)] 'windmove-up)
(define-key global-map [(C shift b)] 'windmove-left)
(define-key global-map [(C shift f)] 'windmove-right)

;; dmacro
;; http://pitecan.com/DynamicMacro/
(defconst *dmacro-key* "\C-t" "dmacro-key")
(global-set-key *dmacro-key* 'dmacro-exec)
(autoload 'dmacro-exec "dmacro" nil t)

;;; undo-tree.el の導入 - とりあえず暇だったし何となく始めたブログ
;;; http://d.hatena.ne.jp/khiker/20100123/undo_tree
(global-undo-tree-mode)


;; (define-key global-map [(super g)] 'global-outputz-mode)

;; jaunte
(require 'jaunte)
(global-set-key [(super j)] 'jaunte)
(set-face-foreground 'jaunte-hint-face "#fdf6e3")
(set-face-background 'jaunte-hint-face "#d33682")

;; zlc
(require 'zlc)

(global-set-key [(super m)] 'toggle-frame-fullscreen)

(setq initial-scratch-message nil)

;; 1000件覚える
(setq kill-ring-max 1000)

(require 'deferred)
(require 'inertial-scroll)
(setq inertias-global-minor-mode-map 
      (inertias-define-keymap
       '(
         ("<next>"  . inertias-up)
         ("<prior>" . inertias-down)
         ("C-v"     . inertias-up)
         ("M-v"     . inertias-down)
         ("s-n"     . inertias-up)
         ("s-p"     . inertias-down)
         ) inertias-prefix-key))
(inertias-global-minor-mode 1)


(global-auto-revert-mode 1)


(defface hlline-face '((t (:background "#fdf6ee"))) nil)
(set-face-background 'hlline-face "#fef8e5")

(setq hl-line-face 'hlline-face)
; (setq hl-line-face 'underline) ; 下線

; (global-hl-line-mode t)



;; dropで開く
(define-key global-map [ns-drag-file] 'ns-find-file)


(require 'popwin)
(setq display-buffer-function 'popwin:display-buffer)
(setq popwin:popup-window-height 0.5)


;; compile scroll
(setq compilation-scroll-output t)

;; (require 'clipboard-to-kill-ring)
;; (clipboard-to-kill-ring t)

;; (require 'suggest-restart)
;; (suggest-restart t)

;; kill-ring に同じ内容の文字列を複数入れない
(defadvice kill-new (before ys:no-kill-new-duplicates activate)
  (setq kill-ring (delete (ad-get-arg 0) kill-ring)))


;; window分割しない
(setq pop-up-windows nil)



;; (require 'shell-command)
;; (shell-command-completion-mode)

;; (require 'shell-history)
;; (define-key shell-mode-map "\M-m" 'shell-add-to-history)

(global-set-key (kbd "C-2") 'er/expand-region)
(global-set-key (kbd "C-M-2") 'er/contract-region)
(global-set-key (kbd "C-@") 'er/contract-region)

;; 直前の単語を削除
(defun kill-region-or-backward-kill-word ()
  (interactive)
  (if (region-active-p)
      (kill-region (point) (mark))
    (backward-kill-word 1)))

(global-set-key (kbd "C-w") 'kill-region-or-backward-kill-word)

;; クオートを入れ替え
(defvar swap-quotes-list
  '((?\" ?\') (?\' ?\`) (?\` ?\")))

(defun transpose-chars-or-swap-quotes (arg)
  (interactive "p")
  (or (swap-quotes) (transpose-chars arg)))

(defun swap-quotes ()
  (interactive)
  (catch 'break
    (dolist (i swap-quotes-list)
      (let ((target-char (car i))
            (replaced-char (cadr i))
            (prev-pos (point)))
        (if (= (char-after (point)) target-char)
            (save-excursion
              (forward-char 1)
              (let ((next-pos (re-search-forward (char-to-string target-char))))
                (if next-pos
                    (subst-char-in-region prev-pos next-pos target-char replaced-char)
                  (message "The corresponding quote is not found.")))
              (throw 'break t)))))
    nil))

(global-set-key (kbd "C-'") 'swap-quotes)

;; (require 'highlight-unique-symbol)
;; (highlight-unique-symbol t)

; (setq highlight-unique-symbol:interval 0.05)

; (add-hook 'post-command-hook 'highlight-unique-symbol:check)
; (remove-hook 'post-command-hook 'highlight-unique-symbol:check)

;; (set-face-foreground 'highlight-unique-symbol:face nil)
;; (set-face-underline  'highlight-unique-symbol:face nil)
;; (set-face-background 'highlight-unique-symbol:face "#e7e4ff")

;; (require 'cl)
;; (defalias 'cl-flet 'flet)
