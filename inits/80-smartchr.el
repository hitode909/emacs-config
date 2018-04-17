(require 'smartchr)
(global-set-key (kbd "=") (smartchr '(" = " "=" " == " "=")))
(global-set-key (kbd "G") (smartchr '("G" "ありがとうございます")))

(add-hook 'cperl-mode-hook
          '(lambda ()
             (define-key cperl-mode-map (kbd ">") (smartchr '(">" " => " ">>" " > " " >= " " => '`!!''" " => \"`!!'\"")))
             (define-key cperl-mode-map (kbd "F") (smartchr '("F" "$" "$_" "$_->" "@$")))
             ;; (define-key cperl-mode-map (kbd "M") (smartchr '("M" "my $`!!' = ")))
             ;; (define-key cperl-mode-map (kbd "D") (smartchr '("D" "use Data::Dumper; warn Dumper `!!';")))
             (define-key cperl-mode-map (kbd "D") (smartchr '("D" "use DDP { show_unicode => 1, use_prototypes => 0, colored => 0 }; p `!!';")))
             (define-key cperl-mode-map (kbd "S") (smartchr '("S" "my ($self) = @_;" "my ($self, $`!!') = @_;")))
             (define-key cperl-mode-map (kbd "C") (smartchr '("C" "my ($class) = @_;" "my ($class, $`!!') = @_;")))
             (define-key cperl-mode-map (kbd ".") (smartchr '("->" "." "..")))
             (define-key cperl-mode-map (kbd "|") (smartchr '(" || " "|")))
             (define-key cperl-mode-map (kbd "&") (smartchr '(" && " "&")))
             (define-key cperl-mode-map (kbd "{") (smartchr '("{" "sub { `!!' ")))
             (define-key cperl-mode-map (kbd "H") (smartchr '("H" "Hatena")))
             (define-key cperl-mode-map (kbd ":") (smartchr '("::" ": ")))
            ))

(add-hook 'ruby-mode-hook
          '(lambda ()
             (define-key ruby-mode-map (kbd "P") (smartchr '("P" "require pp; pp ")))
             (define-key ruby-mode-map (kbd ">") (smartchr '(">" " => " ">>" " > " " >= " " => '`!!''" " => \"`!!'\"")))
             ))

(add-hook 'js-mode-hook
          '(lambda ()
             (define-key js-mode-map (kbd "F") (smartchr '("F" "function() { `!!' }")))
             (define-key js-mode-map (kbd "L") (smartchr '("L" "console.log( `!!' )")))
             ))
