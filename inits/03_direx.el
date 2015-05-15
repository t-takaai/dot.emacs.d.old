
;; ;;----------------------------------------------------------------
;; ;; direx
;; ;; http://cx4a.blogspot.jp/2011/12/popwineldirexel.html
;; ;; https://github.com/m2ym/direx-el
;; ;;
;; (require 'direx)

;; ;; direx:direx-modeのバッファをウィンドウ左辺に幅25でポップアップ
;; ;; :dedicatedにtを指定することで、direxウィンドウ内でのバッファの切り替えが
;; ;; ポップアップ前のウィンドウに移譲される
;; (push '(direx:direx-mode :position left :width 25 :dedicated t)
;;       popwin:special-display-config)

;; ;(global-set-key (kbd "C-x C-j") 'direx:jump-to-directory)
;; (global-set-key (kbd "C-x C-j") 'direx:jump-to-directory-other-window)

;;----------------------------------------------------------------
;; direx-grep
;; https://github.com/aki2o/direx-grep/blob/master/README.md
;; 不安定で使用中止中
;; (require 'direx-grep)
;; (define-key direx:direx-mode-map (kbd "s") 'direx-grep:grep-item)
;; (define-key direx:direx-mode-map (kbd "S") 'direx-grep:grep-item-from-root)
;; (define-key direx:direx-mode-map (kbd "a") 'direx-grep:show-all-item-at-point)
;; (define-key direx:direx-mode-map (kbd "A") 'direx-grep:show-all-item)

