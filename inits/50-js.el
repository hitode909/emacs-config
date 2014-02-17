;; This function is quoted from this page. Thanks to Tomohiro Matsuyama.
;; http://dev.ariel-networks.com/Members/matsuyama/pretty-lambda-in-emacs/
(defun set-pretty-patterns (patterns)
  (loop for (glyph . pairs) in patterns do
    (loop for (regexp . major-modes) in pairs do
      (loop for major-mode in major-modes do
        (let ((major-mode (intern (concat (symbol-name major-mode) "-mode")))
              (n (if (string-match "\\\\([^?]" regexp) 1 0)))
          (font-lock-add-keywords major-mode
                                  `((,regexp (0 (prog1 ()
                                                       (compose-region (match-beginning ,n)
                                                                       (match-end ,n)
                                                                       ,glyph)))))))))))

(set-pretty-patterns '((?寿 ("\\<function\\>" js))))

(add-hook 'js-mode-hook
          '(lambda ()

             (font-lock-add-keywords
              'js-mode
              '(
                (":" . font-lock-warning-face)
                ("Hatean" 0 'font-lock-warning-face)
                ("hatean" 0 'font-lock-warning-face)
                ))

             (local-unset-key (kbd "M-."))
             ))

(defun js2 ()
  (interactive)
  (make-local-variable 'js-indent-level)
  (setq js-indent-level 2)
  (message "Now indent levels is 2")
  )

(defun js4 ()
  (interactive)
  (make-local-variable 'js-indent-level)
  (setq js-indent-level 4)
  (message "Now indent levels is 4")
  )
