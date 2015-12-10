
;;----------------------------------------------------------------
;; #flycheck
;;

(require 'flycheck)
(setq flycheck-check-syntax-automatically '(mode-enabled save))

(add-hook 'after-init-hook #'global-flycheck-mode)
(add-hook 'python-mode-hook 'flycheck-mode)  ;; Python
(add-hook 'ruby-mode-hook 'flycheck-mode)    ;; Ruby
(add-hook 'yatex-mode-hook 'flycheck-mode)   ;; LaTeX
(add-hook 'js2-mode-hook 'flycheck-mode)     ;; JavaScript
(add-hook 'coffee-mode-hook
          `(lambda ()
             (setq flycheck-checker 'coffee)
             (flycheck-mode 1)))             ;; coffee
(add-hook 'ruby-mode-hook
          '(lambda ()
             (setq flycheck-checker 'ruby-rubocop)
             (flycheck-mode 1)))             ;; Ruby

(flycheck-add-next-checker 'javascript-jshint
                           'javascript-gjslint)

;; flymakeを使う場合は、flymake-goto-next-error、flymake-goto-prev-errorを
;; 適当なキーに割り当てておくと便利です。smartrepを使うと少々長いキーを
;; 割り当てても楽に移動できます。
;; http://d.hatena.ne.jp/syohex/20130123/1358950322
(require 'smartrep)
(smartrep-define-key
    global-map "M-g" '(("M-n" . 'flymake-goto-next-error)
                       ("M-p" . 'flymake-goto-prev-error)))

;;----------------------------------------------------------------
;; #flycheck-pos-tip
;; http://qiita.com/senda-akiha/items/cddb02cfdbc0c8c7bc2b
(eval-after-load 'flycheck
  '(custom-set-variables
   '(flycheck-display-errors-function #'flycheck-pos-tip-error-messages)))


;;
;; http://qiita.com/watson1978/items/debafdfc49511fb173e9

 (flycheck-define-checker ruby-rubocop
  "A Ruby syntax and style checker using the RuboCop tool.

See URL `http://batsov.com/rubocop/'."
  :command ("rubocop" "--format" "emacs" "--silent"
            (config-file "--config" flycheck-rubocoprc)
            source)
  :error-patterns
  ((warning line-start
            (file-name) ":" line ":" column ": " (or "C" "W") ": " (message)
            line-end)
   (error line-start
          (file-name) ":" line ":" column ": " (or "E" "F") ": " (message)
          line-end))
  :modes (enh-ruby-mode))
