;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;perlモードの設定;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;perlモードではなくcperl-modeを使う
(defalias 'perl-mode 'cperl-mode)
(setq auto-mode-alist (cons '("\\.t$" . cperl-mode) auto-mode-alist))
(setq auto-mode-alist (cons '("\\.cgi$" . cperl-mode) auto-mode-alist))
(setq auto-mode-alist (cons '("\\.psgi$" . cperl-mode) auto-mode-alist))
(setq auto-mode-alist (cons '("cpanfile$" . cperl-mode) auto-mode-alist))

(add-hook 'cperl-mode-hook
          '(lambda ()
             (setq indent-tabs-mode nil)
             (setq cperl-close-paren-offset -4)
             (setq cperl-continued-statement-offset 4)
             (setq cperl-indent-level 4)
             (setq cperl-indent-parens-as-block t)
             (setq cperl-tab-always-indent t)
             (setq cperl-indent-parens-as-block t)

             (define-key cperl-mode-map [(super T)] 'run-perl-test)
             (define-key cperl-mode-map [(super t)] 'run-perl-method-test)

             (local-set-key (kbd "C-c C-c C-u") 'popup-editor-perl-use)

             (font-lock-add-keywords
              'cperl-mode
              '(("!" . font-lock-warning-face)))

             ))

(font-lock-add-keywords
 'cperl-mode
 '(
   ("TODO" 0 'font-lock-warning-face)
   ("XXX" 0 'font-lock-warning-face)
   ("Hatean" 0 'font-lock-warning-face)
   ))
