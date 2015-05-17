;;----------------------------------------------------------------
;; popwin
;; http://d.hatena.ne.jp/m2ym/20110120/1295524932
;;
(require 'popwin)
(popwin-mode 1)

;; (setq display-buffer-function 'popwin:display-buffer)
;; (setq popwin:popup-window-position 'bottom)
;; (push '("*YaTeX-typesetting*") popwin:special-display-config)
;; (push '("helm" :regexp t :height 0.4) popwin:special-display-config)
;; (push '("*Completions*") popwin:special-display-config)

(global-set-key (kbd "C-z") popwin:keymap)
