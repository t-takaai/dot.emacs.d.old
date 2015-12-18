
;;----------------------------------------------------------------
;; #misc
;;

;; バックアップファイルの置き場所を指定する
;; http://exlight.net/devel/emacs/backup_file/
;; (defun make-backup-file-name (filename)
;;   (concat "~/.bak/" (file-name-nondirectory filename)))

(setq make-backup-files t)
(setq backup-directory "~/.backup")
(if (and (boundp 'backup-directory)
         (not (fboundp 'make-backup-file-name-original)))
    (progn
      (fset 'make-backup-file-name-original
            (symbol-function 'make-backup-file-name))
      (defun make-backup-file-name (filename)
        (if (and (file-exists-p (expand-file-name backup-directory))
                 (file-directory-p (expand-file-name backup-directory)))
            (concat (expand-file-name backup-directory) 
                    "/" (file-name-nondirectory filename))
          (make-backup-file-name-original filename)))))

;;; 右から左に読む言語に対応させないことで描画高速化
(setq-default bidi-display-reordering nil)

;;; splash screenを無効にする
(setq inhibit-splash-screen t)

;;; 同じ内容を履歴に記録しないようにする
(setq history-delete-duplicates t)

;; C-u C-SPC C-SPC ...でどんどん過去のマークを遡る
(setq set-mark-command-repeat-pop t)

;; C-kで行全体を削除
(setq kill-whole-line t)

;; マウスで選択するとコピーする Emacs 24 ではデフォルトが nil
(setq mouse-drag-copy-region t)

;; 日本語の設定
(set-language-environment 'Japanese)
(prefer-coding-system 'utf-8)
;(setq default-input-method "MacOSX")

;; クリップボードの文字コード
(set-selection-coding-system 'utf-8)

;; 端末の文字コード
(set-terminal-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8)

;; ファイル名の文字コード
(require 'ucs-normalize)
(set-file-name-coding-system 'utf-8-hfs)

;; フォントの設定
(let ((system-name (system-name)))
  (cond
;   ;; systemA または systemB で実行中の場合
;   ((string-match "^\\(systemA\\|systemB\\)\\(\\..+\\)*$" system-name)
;    (load "~/.emacs-AorB"))
;   ;; systemC で実行中の場合
;   ((string-match "^systemC\\(\\..+\\)*$" system-name)
;    (load "~/.emacs-C"))
   ;; 指定されていないマシンで実行中の場合
;   (t
;    (message (concat "Unknown Host: " system-name)))))

   ;; tauon で実行中の場合
   ((string-match "^tauon\\(\\..+\\)*$" system-name)
     ;; (create-fontset-from-ascii-font "Menlo-18:weight=normal:slant=normal" nil "menlokakugo")
     ;; (set-fontset-font "fontset-menlokakugo" 'unicode (font-spec :family "Hiragino Kaku Gothic ProN" ) nil 'append)
     ;; (add-to-list 'default-frame-alist '(font . "fontset-menlokakugo"))
     ;; (setq face-font-rescale-alist '((".*Hiragino.*" . 1.2) (".*Menlo.*" . 1.0)))

     ;; Ricty フォント
     (create-fontset-from-ascii-font "Ricty-18:weight=normal:slant=normal" nil "ricty")
     (set-fontset-font "fontset-ricty"
        	       'unicode
        	       (font-spec :family "Ricty" :size 18)
        	       nil
        	       'append)
     (add-to-list 'default-frame-alist '(font . "fontset-ricty"))

     ;; Source Han Code JP

    ;; (create-fontset-from-ascii-font "Source Han Code JP-18:weight=light:slant=normal" nil "hancode")
    ;; (set-fontset-font "fontset-hancode" 'unicode (font-spec :family "Source Han Code JP Light" :size 18) nil 'append)
    ;; (add-to-list 'default-frame-alist '(font . "fontset-hancode"))

    ;; (create-fontset-from-ascii-font "Source Han Code JP-16:weight=normal:slant=normal" nil "hancode")
    ;; (set-fontset-font "fontset-hancode" 'unicode (font-spec :family "Source Han Code JP Normal" :size 16) nil 'append)
    ;; (add-to-list 'default-frame-alist '(font . "fontset-hancode"))

     ;; フレーム位置設定(ウィンドウ） 
     (setq default-frame-alist
	   (append
	    '((top . 22)    ; フレームの Y 位置(ピクセル数)
	      (left . 0)    ; フレームの X 位置(ピクセル数)
	      (width . 120)    ; フレーム幅(文字数)
	      (height . 81)   ; フレーム高(文字数)
	      ) default-frame-alist))
     (setq initial-frame-alist
	   (append
	    '((top . 22)    ; フレームの Y 位置(ピクセル数)
	      (left . 0)    ; フレームの X 位置(ピクセル数)
	      (width . 120)    ; フレーム幅(文字数)
	      (height . 81)   ; フレーム高(文字数)
	      ) initial-frame-alist)))

     ;; (setq default-frame-alist
     ;; 	   (append
     ;; 	    '((top . 22)    ; フレームの Y 位置(ピクセル数)
     ;; 	      (left . 0)    ; フレームの X 位置(ピクセル数)
     ;; 	      (width . 100)    ; フレーム幅(文字数)
     ;; 	      (height . 70)   ; フレーム高(文字数)
     ;; 	      ) default-frame-alist))
     ;; (setq initial-frame-alist
     ;; 	   (append
     ;; 	    '((top . 22)    ; フレームの Y 位置(ピクセル数)
     ;; 	      (left . 0)    ; フレームの X 位置(ピクセル数)
     ;; 	      (width . 100)    ; フレーム幅(文字数)
     ;; 	      (height . 70)   ; フレーム高(文字数)
     ;; 	      ) initial-frame-alist)))

   ;; muon で実行中の場合
   ((string-match "^muon\\(\\..+\\)*$" system-name)
    (create-fontset-from-ascii-font "Menlo-14:weight=normal:slant=normal" nil "menlokakugo")
    (set-fontset-font "fontset-menlokakugo" 'unicode (font-spec :family "Hiragino Kaku Gothic ProN" ) nil 'append)
    (add-to-list 'default-frame-alist '(font . "fontset-menlokakugo"))
    (setq face-font-rescale-alist '((".*Hiragino.*" . 1.2) (".*Menlo.*" . 1.0)))
    ;; フレーム位置設定(ウィンドウ） 
(setq default-frame-alist
      (append
       '((top . 22)    ; フレームの Y 位置(ピクセル数)
	 (left . 0)    ; フレームの X 位置(ピクセル数)
	 (width . 82)    ; フレーム幅(文字数)
	 (height . 42)   ; フレーム高(文字数)
	 ) default-frame-alist))
(setq initial-frame-alist
      (append
       '((top . 22)    ; フレームの Y 位置(ピクセル数)
	 (left . 0)    ; フレームの X 位置(ピクセル数)
	 (width . 82)    ; フレーム幅(文字数)
	 (height . 42)   ; フレーム高(文字数)
	 ) initial-frame-alist)))

;; 指定されていないマシンで実行中の場合
   (t
    (create-fontset-from-ascii-font "Menlo-14:weight=normal:slant=normal" nil "menlokakugo")
     (set-fontset-font "fontset-menlokakugo" 'unicode (font-spec :family "Hiragino Kaku Gothic ProN" ) nil 'append)
     (add-to-list 'default-frame-alist '(font . "fontset-menlokakugo"))
     (setq face-font-rescale-alist '((".*Hiragino.*" . 1.2) (".*Menlo.*" . 1.0))))))
    
;; 対応するカッコをハイライト
(show-paren-mode 1)

;; スクロールバーを非表示に
(set-scroll-bar-mode nil)

;; フルスクリーン
(defun my-toggle-fullscreen ()
  "Toggle fullscreen."
  (interactive)
  (if (eq (frame-parameter nil 'fullscreen) 'fullboth)
      (progn
        (set-frame-parameter nil 'fullscreen nil)
        (display-time-mode 0))
    (set-frame-parameter nil 'fullscreen 'fullboth)
    (display-time-mode 1)))
(global-set-key (kbd "C-M-x") 'my-toggle-fullscreen)

;; フレームの最大化
(require 'maxframe)
(defvar my-fullscreen-p t "Check if fullscreen is on or off")
(defun my-toggle-fullscreen ()
(interactive)
(setq my-fullscreen-p (not my-fullscreen-p))
(if my-fullscreen-p
(restore-frame)
(maximize-frame)))
(global-set-key (kbd "C-M-z") 'my-toggle-fullscreen)

;; Dired の x や D でゴミ箱に捨てる。Finder での「取り消し」「戻す」は不可。
(when (fboundp 'system-move-file-to-trash)
  (defadvice dired-do-flagged-delete
    (around move-to-trash activate)
    "Use `system-move-file-to-trash'."
    (let ((delete-by-moving-to-trash 'system-move-file-to-trash))
      ad-do-it))

  (defadvice dired-do-delete
    (around move-to-trash activate)
    "Use `system-move-file-to-trash'."
    (let ((delete-by-moving-to-trash 'system-move-file-to-trash))
      ad-do-it)))

;; メニューバー
(global-set-key "\M-`" 'menu-bar-open) ; tmm-menubar

;; Control-h
(global-set-key "\C-h" 'delete-backward-char)

;; otickther-window
(global-set-key [?\C-.] 'other-window)

;; command キーを meta キーに
(setq ns-command-modifier (quote meta))
(setq ns-left-alternate-modifier (quote super))
(setq ns-right-command-modifier (quote hyper))

;; 行番号の表示(mode line)
(line-number-mode t)

;; 行番号の表示(left side)
(global-set-key [f9] 'global-linum-mode)
(setq linum-format "%3d ")

;; 列番号の表示
(column-number-mode t)

;; カーソル点滅表示
(blink-cursor-mode 0)

;; スクロール時のカーソル位置の維持
(setq scroll-preserve-screen-position t)

;; スクロール行数（一行ごとのスクロール）
(setq vertical-centering-font-regexp ".*")
(setq scroll-conservatively 35)
(setq scroll-margin 0)
(setq scroll-step 1)

;; 画面スクロール時の重複行数
(setq next-screen-context-lines 1)

;; 起動メッセージの非表示
(setq inhibit-startup-message t)

;; ツールバーを非表示
(tool-bar-mode -1)

;;ブックマークを変更したら即保存する
(setq bookmark-save-flag 1)

;;最近使ったブックマークを上に持ってきてくれる
(progn
  (setq bookmark-sort-flag nil)
  (defun bookmark-arrange-latest-top ()
    (let ((latest (bookmark-get-bookmark bookmark)))
      (setq bookmark-alist (cons latest (delq latest bookmark-alist))))
    (bookmark-save))
  (add-hook 'bookmark-after-jump-hook 'bookmark-arrange-latest-top))

;; バッファの同一ファイル名を区別する
(require 'uniquify)
(setq uniquify-buffer-name-style 'post-forward-angle-brackets)
(setq uniquify-ignore-buffers-re "*[^*]+*")

;; 以前開いたファイルを再度開いたとき、元のカーソル位置を復元する
;; http://www.emacswiki.org/emacs/SavePlace
(when (require 'saveplace nil t)
  (setq-default save-place t)
  (setq save-place-file "~/.emacs.d/saved-places"))

;;; インデントにTABを使わないようにする
(setq-default indent-tabs-mode nil)

;; ミニバッファ履歴を次回Emacs起動時にも保存する
(savehist-mode 1)

;;; GCを減らして軽くする
;(setq gc-cons-threshold (* 10 gc-cons-threshold))

;;; ログの記録行数を増やす
(setq message-log-max 10000)

;;; 履歴をたくさん保存する
(setq history-length 1000)

;; Window 分割を画面サイズに従って計算する
;; http://blog.shibayu36.org/entry/2012/12/18/161455
(defun split-window-vertically-n (num_wins)
  (interactive "p")
  (if (= num_wins 2)
      (split-window-vertically)
    (progn
      (split-window-vertically
       (- (window-height) (/ (window-height) num_wins)))
      (split-window-vertically-n (- num_wins 1)))))
(defun split-window-horizontally-n (num_wins)
  (interactive "p")
  (if (= num_wins 2)
      (split-window-horizontally)
    (progn
      (split-window-horizontally
       (- (window-width) (/ (window-width) num_wins)))
      (split-window-horizontally-n (- num_wins 1)))))

;; Window 分割・移動を C-t で
(defun other-window-or-split ()
  (interactive)
  (when (one-window-p)
    (if (>= (window-body-width) 270)
        (split-window-horizontally-n 3)
      (split-window-horizontally)))
  (other-window 1))
(global-set-key (kbd "C-t") 'other-window-or-split)

;; バッファ自動再読み込み
(global-auto-revert-mode 1)

;; 現在行のハイライト
(defface hlline-face
  '((((class color)
      (background dark))
     (:background "dark slate gray"))
    (((class color)
      (background light))
     (:background  "#98FB98"))
    (t
     ()))
  "*Face used by hl-line.")
(setq hl-line-face 'hlline-face)
(global-hl-line-mode)


;; ucs-normalize-NFC-region で濁点分離を直す
;; M-x ucs-normalize-NFC-buffer または "C-x RET u" で、
;; バッファ全体の濁点分離を直します。
;; 参考：
;; http://d.hatena.ne.jp/nakamura001/20120529/1338305696 
;; http://www.sakito.com/2010/05/mac-os-x-normalization.html
(require 'ucs-normalize)
(prefer-coding-system 'utf-8-hfs)
(setq file-name-coding-system 'utf-8-hfs)
(setq locale-coding-system 'utf-8-hfs)

(defun ucs-normalize-NFC-buffer ()
  (interactive)
  (ucs-normalize-NFC-region (point-min) (point-max))
  )

(global-set-key (kbd "C-x RET u") 'ucs-normalize-NFC-buffer)

;; バッファ全体のコンマとピリオドを全角に変換
;; http://d.hatena.ne.jp/mhrs/20061124/p1
(defun my-replace-comma-period (start end)
  "リージョンの「hoge」と「fuga」を「ほげ」と「ふが」に置換する"
  (interactive "r")
  (save-excursion
    (save-restriction
      (narrow-to-region start end)
      (goto-char (point-min))
      (while (re-search-forward "," nil t)
        (replace-match "，"))
      (goto-char (point-min))
      (while (re-search-forward "\\." nil t)
        (replace-match "．")))))

(global-set-key (kbd "C-x RET j") 'my-replace-comma-period)



;; -------------------------------------------------------------------------
;; @ whitespace
;; 全角スペースを強調。赤くなる。
;; http://bokuweb.hatenablog.com/entry/emcas-nyumon

;; (global-whitespace-mode 1)
;; (setq whitespace-space-regexp "\\(\u3000\\)")
;; (setq whitespace-style '(face tabs tab-mark spaces space-mark))
;; (setq whitespace-display-mappings ())
;; (set-face-foreground 'whitespace-tab "#F1C40F")
;; (set-face-background 'whitespace-space "#E74C3C")



;;----------------------------------------------------------------
;; #backup
;;
;; 変更ファイルのバックアップ
;   (setq make-backup-files nil)

;; 変更ファイルの番号つきバックアップ
;   (setq version-control nil)

;; 編集中ファイルのバックアップ
;   (setq auto-save-list-file-name nil)
;   (setq auto-save-list-file-prefix nil)

;; 編集中ファイルのバックアップ先
;   (setq auto-save-file-name-transforms
;         `((".*" ,temporary-file-directory t)))

;; 編集中ファイルのバックアップ間隔（秒）
;   (setq auto-save-timeout 30)

   ;; 編集中ファイルのバックアップ間隔（打鍵）
;   (setq auto-save-interval 500)

   ;; バックアップ世代数
;   (setq kept-old-versions 1)
;   (setq kept-new-versions 2)

   ;; 上書き時の警告表示
   ;- (setq trim-versions-without-asking nil)

   ;; 古いバックアップファイルの削除
;   (setq delete-old-versions t)



;;----------------------------------------------------------------
;; #cua-mode
;; 矩形編集
;; C-Ret で矩形選択
;; 詳しいキーバインド操作：http://dev.ariel-networks.com/articles/emacs/part5/
(cua-mode t)
(setq cua-enable-cua-keys nil) ;; 変なキーバインド禁止



;;----------------------------------------------------------------
;; hippie-expand
;;
;;; hippie-expand
(global-set-key "\C-o" 'hippie-expand)
(setq hippie-expand-try-functions-list
      '(yas/hippie-try-expand
        try-expand-dabbrev
        try-expand-dabbrev-all-buffers
        try-expand-dabbrev-from-kill
        try-complete-file-name-partially
        try-complete-file-name
        try-expand-all-abbrevs
        try-expand-list try-expand-line
        try-complete-lisp-symbol-partially
        try-complete-lisp-symbol))


;;----------------------------------------------------------------
;; EmacsからDictionary.appを起動する方法Add Star
;; http://d.hatena.ne.jp/tunefs/20130212/p1
;;
(global-set-key
 "\C-\M-d" 
 (lambda ()
   (interactive)
   (let ((url (concat "dict://" (read-from-minibuffer "" (current-word)))))
     (browse-url url))))


;; stash.el
;; 永続化したい変数を宣言する
;;; (or stashed 'nil)は読み込み時にデフォルトでnilにするおまじない
(defstash kill-ring "kill-ring.el" nil (or stashed 'nil))
;(defstash minibuffer-history "minibuffer-history.el" nil (or stashed 'nil))

;; emacsで編集中のファイルをデフォルトブラウザで開く
;; http://blog.shibayu36.org/entry/2012/12/15/224627
;; default-browser
;; http://www.leancrew.com/all-this/2012/04/default-browser-script/ あたりから、default browserを取得するスクリプトを持ってくる。~/bin/辺りに置く。

(defun browse-current-file ()
  (interactive)
  (let ((data-url
         (concat "file://" (buffer-file-name)))
        (default-browser
          (replace-regexp-in-string "[\n\r]+$" ""
            (shell-command-to-string (expand-file-name "~/bin/default-browser")))))
    (shell-command (concat "open -b " default-browser " " data-url))))

(global-set-key (kbd "C-|") 'browse-current-file)


;; タイトルバーにファイルのフルパス表示
(setq frame-title-format
      (format "%%f - Emacs@%s" (system-name)))

;; フレームの透明度
(set-frame-parameter (selected-frame) 'alpha '(0.9))









