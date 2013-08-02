(require 'flymake)

;; GUIの警告は表示しない
(setq flymake-gui-warnings-enabled nil)

;; 全てのファイルで flymakeを有効化
(add-hook 'find-file-hook 'flymake-find-file-hook)

;; flymake のエラーメッセージを popup-tip で表示 - とりあえず暇だったし何となく始めたブログ

;; http://d.hatena.ne.jp/khiker/20100203/popup_flymake
(require 'popup)
(defun popup-flymake-display-error ()
  (interactive)
  (let* ((line-no            (flymake-current-line-no))
         (line-err-info-list (nth 0 (flymake-find-err-info flymake-err-info
                                                           line-no)))
         (count              (length line-err-info-list)))
    (while (> count 0)
      (when line-err-info-list
        (let* ((file       (flymake-ler-file (nth (1- count)
                                                  line-err-info-list)))
               (full-file (flymake-ler-full-file (nth (1- count)
                                                      line-err-info-list)))
               (text      (flymake-ler-text (nth (1- count)
                                                 line-err-info-list)))
               (line      (flymake-ler-line (nth (1- count)
                                                 line-err-info-list))))
          (popup-tip (format "[%s] %s" line text))))
      (setq count (1- count)))))

(add-hook
 'flymake-mode-hook
 '(lambda ()
    (local-set-key [(super e)] 'flymake-goto-next-error)
    ;; (local-set-key (kbd "C-c p") 'flymake-goto-prev-error)
    (local-set-key [(super E)] 'popup-flymake-display-error)))
