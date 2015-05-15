
;;----------------------------------------------------------------
;; auto-save-buffers
;;
;(require 'auto-save-buffers)
;(run-with-idle-timer 0.5 t 'auto-save-buffers) 
(require 'auto-save-buffers-enhanced)
(setq auto-save-buffers-enhanced-interval 3) ; 指定のアイドル秒で保存
(auto-save-buffers-enhanced t)

