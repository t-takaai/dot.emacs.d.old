

;;----------------------------------------------------------------
;; #flycheck
;;

(require 'flycheck)
(setq flycheck-check-syntax-automatically '(mode-enabled save))

(add-hook 'after-init-hook #'global-flycheck-mode)
;(add-hook 'python-mode-hook 'flycheck-mode)  ;; Python
(add-hook 'ruby-mode-hook 'flycheck-mode)    ;; Ruby
;(add-hook 'yatex-mode-hook 'flycheck-mode)   ;; LaTeX
;; flycheck
(add-hook 'coffee-mode-hook
          `(lambda ()
             (setq flycheck-checker 'coffee)
             (flycheck-mode 1))) ;; coffee
;;----------------------------------------------------------------
;; #flycheck-pos-tip
;; http://qiita.com/senda-akiha/items/cddb02cfdbc0c8c7bc2b
(eval-after-load 'flycheck
  '(custom-set-variables
   '(flycheck-display-errors-function #'flycheck-pos-tip-error-messages)))

