

;;----------------------------------------------------------------
;; #tabbar
;;
;; (require 'cl)
;; (require 'tabbar)
;; (tabbar-mode 1)

;; ;; グループ化しない
;; (setq tabbar-buffer-groups-function nil)

;; ; 左に表示されるボタンを無効化
;; (dolist (btn '(tabbar-buffer-home-button
;;                tabbar-scroll-left-button
;;                tabbar-scroll-right-button))
;;   (set btn (cons (cons "" nil)
;;                  (cons "" nil))))

;; ;; タブに表示させるバッファの設定
;; (defvar my-tabbar-displayed-buffers
;; ;;  '("*scratch*" "*Messages*" "*Backtrace*" "*Colors*" "*Faces*" "*vc-")
;;   '("*Backtrace*" "*Colors*" "*Faces*" "*vc-")
;;   "*Regexps matches buffer names always included tabs.")
;;  
;; (defun my-tabbar-buffer-list ()
;;   "Return the list of buffers to show in tabs.
;; Exclude buffers whose name starts with a space or an asterisk.
;; The current buffer and buffers matches `my-tabbar-displayed-buffers'
;; are always included."
;;   (let* ((hides (list ?\  ?\*))
;;          (re (regexp-opt my-tabbar-displayed-buffers))
;;          (cur-buf (current-buffer))
;;          (tabs (delq nil
;;                      (mapcar (lambda (buf)
;;                                (let ((name (buffer-name buf)))
;;                                  (when (or (string-match re name)
;;                                            (not (memq (aref name 0) hides)))
;;                                    buf)))
;;                              (buffer-list)))))
;;     ;; Always include the current buffer.
;;     (if (memq cur-buf tabs)
;;         tabs
;;       (cons cur-buf tabs))))

;; ;; (defun my-tabbar-buffer-list ()
;; ;; (remove-if
;; ;; (lambda (buffer)
;; ;; (find (aref (buffer-name buffer) 0) " *"))
;; ;; (buffer-list)))
;;  
;; (setq tabbar-buffer-list-function 'my-tabbar-buffer-list)

;; ;; appearances
;; (setq tabbar-separator '(1.0)) ;; タブセパレータの長さ
;; (set-face-attribute 'tabbar-default nil
;;                     :family "Ricty"
;;                     :foreground "#c4c1b0"
;;                     :background "#c4c1b0"
;;                     :height 1.0)
;; (set-face-attribute 'tabbar-unselected nil
;;                     :foreground "#002c37"
;;                     :background "#c4c1b0"
;;                     :box nil)
;; (set-face-attribute 'tabbar-selected nil
;;                     :foreground "#e4007e"
;;                     :background "#ffffff"
;;                     :box nil)
;; (set-face-attribute 'tabbar-button nil
;;                     :box nil)
;; (set-face-attribute 'tabbar-separator nil
;; 		    :foreground "#c4c1b0"
;; ;;		    :background "#c4c1b0"
;; 		    :background "#e4e1b0"
;; 		    :height 1.0)

;; (global-set-key [(C-tab)]   'tabbar-forward-tab)
;; (global-set-key [(C-S-tab)] 'tabbar-backward-tab)
;; (global-set-key "\M-]"      'tabbar-forward-tab)
;; (global-set-key "\M-["      'tabbar-backward-tab)
