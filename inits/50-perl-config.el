;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;perlモードの設定;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;perlモードではなくcperl-modeを使う
(defalias 'perl-mode 'cperl-mode)
(setq auto-mode-alist (cons '("\\.t$" . cperl-mode) auto-mode-alist))
(setq auto-mode-alist (cons '("\\.cgi$" . cperl-mode) auto-mode-alist))
(setq auto-mode-alist (cons '("\\.psgi$" . cperl-mode) auto-mode-alist))
(setq auto-mode-alist (cons '("cpanfile$" . cperl-mode) auto-mode-alist))

(defun run-perl-test ()
  "test実行します"
  (interactive)
  (compile (format "cd %s; carton exec -- perl %s" (vc-git-root default-directory) (buffer-file-name (current-buffer)))))

(defun run-perl-method-test ()
  (interactive)
  (let (
        (command compile-command)
        (test-method nil))
    (save-excursion
      (when (or
             (re-search-backward "\\bsub\s+\\([_[:alpha:]]+\\)\s*:\s*Test" nil t)
             (re-search-forward "\\bsub\s+\\([_[:alpha:]]+\\)\s*:\s*Test" nil t))
        (setq test-method (match-string 1))))
    (if test-method
        (compile (format "cd  %s; TEST_METHOD=%s carton exec -- perl %s"
                         (vc-git-root default-directory)
                         (shell-quote-argument test-method)
                         (buffer-file-name (current-buffer))))
      (let ((a 1))
        (save-excursion
          (when (or
                 (re-search-backward "^subtest\s+['\"]?\\([^'\"\s]+\\)['\"]?\s*=>\s*sub" nil t)
                 (re-search-foreward "^subtest\s+['\"]?\\([^'\"\s]+\\)['\"]?\s*=>\s*sub" nil t))
            (setq test-method (match-string 1))))
        (if test-method
            (compile (format "cd  %s; SUBTEST_FILTER=%s carton exec -- perl %s"
                             (vc-git-root default-directory)
                             (shell-quote-argument test-method)
                             (buffer-file-name (current-buffer)))))
        (message "not match")
        ))))


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

;; plenv

(require 'plenv)
(plenv-global "5.14.2")

;; flymake

(defun flymake-perl-init ()
  (let* ((perl (guess-plenv-perl-path))
         (root (expand-file-name (vc-git-root default-directory))))
    (list shell-file-name (list "-c" (format "perl '-MProject::Libs lib_dirs => [qw(local/lib/perl5), glob(qw(modules/*/lib))]' -wc %s" (shell-quote-argument buffer-file-name))) root)
    ))

(push '(".+\\.p[ml]$" flymake-perl-init) flymake-allowed-file-name-masks)
(push '(".+\\.psgi$" flymake-perl-init) flymake-allowed-file-name-masks)
(push '(".+\\.t$" flymake-perl-init) flymake-allowed-file-name-masks)

(add-hook 'cperl-mode-hook (lambda () (flymake-mode t)))
