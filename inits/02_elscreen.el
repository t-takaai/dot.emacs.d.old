

;; ;;----------------------------------------------------------------
;; ;; # el-screen
;; ;; http://rubikitch.com/2014/09/05/elscreen/
;; ;;
;; ;;; プレフィクスキーはC-z
;; (setq elscreen-prefix-key (kbd "C-z"))
;; (elscreen-start)
;; ;;; タブの先頭に[X]を表示しない
;; (setq elscreen-tab-display-kill-screen nil)
;; ;;; header-lineの先頭に[<->]を表示しない
;; (setq elscreen-tab-display-control nil)
;; ;;; バッファ名・モード名からタブに表示させる内容を決定する(デフォルト設定)
;; (setq elscreen-buffer-to-nickname-alist
;;       '(("^dired-mode$" .
;;          (lambda ()
;;            (format "Dired(%s)" dired-directory)))
;;         ("^Info-mode$" .
;;          (lambda ()
;;            (format "Info(%s)" (file-name-nondirectory Info-current-file))))
;;         ("^mew-draft-mode$" .
;;          (lambda ()
;;            (format "Mew(%s)" (buffer-name (current-buffer)))))
;;         ("^mew-" . "Mew")
;;         ("^irchat-" . "IRChat")
;;         ("^liece-" . "Liece")
;;         ("^lookup-" . "Lookup")))
;; (setq elscreen-mode-to-nickname-alist
;;       '(("[Ss]hell" . "shell")
;;         ("compilation" . "compile")
;;         ("-telnet" . "telnet")
;;         ("dict" . "OnlineDict")
;;         ("*WL:Message*" . "Wanderlust")))

;; ;; http://nishikawasasaki.hatenablog.com/entry/20110313/1300031344
;; (if window-system
;;     (define-key elscreen-map "\C-z" 'iconify-or-deiconify-frame)
;;   (define-key elscreen-map "\C-z" 'suspend-emacs))

;; ;; 以下は自動でスクリーンを生成する場合の設定
;; (defmacro elscreen-create-automatically (ad-do-it)
;;   `(if (not (elscreen-one-screen-p))
;;        ,ad-do-it
;;      (elscreen-create)
;;      (elscreen-notify-screen-modification 'force-immediately)
;;      (elscreen-message "New screen is automatically created")))

;; (defadvice elscreen-next (around elscreen-create-automatically activate)
;;   (elscreen-create-automatically ad-do-it))

;; (defadvice elscreen-previous (around elscreen-create-automatically activate)
;;   (elscreen-create-automatically ad-do-it))

;; (defadvice elscreen-toggle (around elscreen-create-automatically activate)
;;   (elscreen-create-automatically ad-do-it))
     
;; (setq elscreen-display-tab 10) ; タブの幅（６以上じゃないとダメ）
;; (setq elscreen-tab-display-kill-screen nil) ; タブの左端の×を非表示

;; (global-set-key (kbd "C-z C-c") 'elscreen-clone) ; 今のウインドウを基に作成
;; (global-set-key (kbd "C-z C-k") 'elscreen-kill-screen-and-buffers) ; スクリーンとバッファをkill
;; (global-set-key [(C-tab)] 'elscreen-next) ; ブラウザみたいに
;; (global-set-key [(C-S-tab)] 'elscreen-previous) ; ブラウザみたいに　その2

;; ;; elscreen-server
;; (require 'elscreen-server)

;; ;; elscreen-color-theme
;; (require 'elscreen-color-theme)

;; ;; (custom-set-faces
;; ;;  '(elscreen-tab-control-face ((T (:background "color-234" :foreground "brightwhite" :underline t))))
;; ;;  '(elscreen-tab-current-screen-face ((t (:background "color-243" :foreground "brightwhite"))))
;; ;;  '(elscreen-tab-other-screen-face ((t (:background "color-235" :foreground "brightwhite" :underline t)))))

;; (custom-set-faces
;;  '(elscreen-tab-background-face
;;    ((t (:background "gray10"))))
;;  '(elscreen-tab-control-face
;;    ((t (:background "gray10" :foreground "gray60"))))
;;  '(elscreen-tab-current-screen-face
;;    ((t (:background "gray75" :foreground "black"))))
;;  '(elscreen-tab-other-screen-face
;;    ((t (:background "gray30" :foreground "gray80"))))
;; )

;; ;;;
;; ;;; elscreen のタブの並びと数字キーの並びを合わせる
;; ;;; http://d.hatena.ne.jp/ken_m/20110607/1307451681

;; ;; 既存スクリーンのリストを要求された際、0 番が存在しているかのように偽装する
;; (defadvice elscreen-get-screen-list (after my-ad-elscreen-get-screenlist disable)
;;   (add-to-list 'ad-return-value 0))

;; ;; スクリーン生成時に 0 番が作られないようにする
;; (defadvice elscreen-create (around my-ad-elscreen-create activate)
;;   (interactive)
;;   ;; 0 番が存在しているかのように偽装
;;   (ad-enable-advice 'elscreen-get-screen-list 'after 'my-ad-elscreen-get-screenlist)
;;   (ad-activate 'elscreen-get-screen-list)
;;   ;; 新規スクリーン生成
;;   ad-do-it
;;   ;; 偽装解除
;;   (ad-disable-advice 'elscreen-get-screen-list 'after 'my-ad-elscreen-get-screenlist)
;;   (ad-activate 'elscreen-get-screen-list))

;; ;; スクリーン 1 番を作成し 0 番を削除 (起動時、フレーム生成時用)
;; (defun my-elscreen-kill-0 ()
;;   (when (and (elscreen-one-screen-p)
;;              (elscreen-screen-live-p 0))
;;     (elscreen-create)
;;     (elscreen-kill 0)))

;; ;; フレーム生成時のスクリーン番号が 1 番になるように
;; (defadvice elscreen-make-frame-confs (after my-ad-elscreen-make-frame-confs activate)
;;   (let ((selected-frame (selected-frame)))
;;     (select-frame frame)
;;     (my-elscreen-kill-0)
;;     (select-frame selected-frame)))

;; ;; 起動直後のスクリーン番号が 1 番になるように
;; (add-hook 'after-init-hook 'my-elscreen-kill-0)

;; ;; M-0 ～ M-9 で指定番号のスクリーンに切り替え
;; (let ((i 0))
;;   (while (<= i 9)
;;     (define-key esc-map (number-to-string i)
;;                         `(lambda () (interactive) (elscreen-goto ,i)))
;;     (setq i (1+ i))))

;; ;; screenの順番を手軽に変更
;; ;; http://qiita.com/fujimisakari/items/d7f1b904de11dcb018c3

;; (defun elscreen-swap-previous()
;;   "Interchange screens selected currently and previous."
;;   (interactive)
;;   (cond
;;    ((elscreen-one-screen-p)
;;     (elscreen-message "There is only one screen, cannot swap"))
;;    (t
;;     (let* ((screen-list (sort (elscreen-get-screen-list) '>))
;;            (previous-screen
;;             (or (nth 1 (memq (elscreen-get-current-screen) screen-list))
;;                (car screen-list)))
;;            (current-screen (elscreen-get-current-screen))
;;            (current-screen-property
;;             (elscreen-get-screen-property current-screen))
;;            (previous-screen-property
;;             (elscreen-get-screen-property previous-screen)))
;;       (elscreen-set-screen-property current-screen previous-screen-property)
;;       (elscreen-set-screen-property previous-screen current-screen-property)
;;       (elscreen-goto-internal (elscreen-get-current-screen)))))
;;   (elscreen-previous))

;; (defun elscreen-swap-next()
;;   "Interchange screens selected currently and next."
;;   (interactive)
;;   (cond
;;    ((elscreen-one-screen-p)
;;     (elscreen-message "There is only one screen, cannot swap"))
;;    (t
;;     (let* ((screen-list (sort (elscreen-get-screen-list) '<))
;;            (next-screen
;;             (or (nth 1 (memq (elscreen-get-current-screen) screen-list))
;;                (car screen-list)))
;;            (current-screen (elscreen-get-current-screen))
;;            (current-screen-property
;;             (elscreen-get-screen-property current-screen))
;;            (next-screen-property
;;             (elscreen-get-screen-property next-screen)))
;;       (elscreen-set-screen-property current-screen next-screen-property)
;;       (elscreen-set-screen-property next-screen current-screen-property)
;;       (elscreen-goto-internal (elscreen-get-current-screen)))))
;;      (elscreen-next))

;; (global-set-key (kbd "C-M-<right>") 'elscreen-swap-next)           ; screenの配置位置ずらし(右)
;; (global-set-key (kbd "C-M-<left>") 'elscreen-swap-previous)        ; screen配置位置ずらし(左)

;; ;; elscreen-dired
;; (require 'elscreen-dired)

