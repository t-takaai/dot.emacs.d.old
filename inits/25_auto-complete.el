
;;----------------------------------------------------------------
;; auto-complete
;;
;(add-to-list 'load-path "~/.emacs.d/auto-complete")
;(add-to-list 'ac-dictionary-directories "~/.emacs.d/auto-complete/dict")
;(ac-config-default)

;; カスタマイズ
;(setq ac-auto-start 2)  ;; n文字以上の単語の時に補完を開始
;(setq ac-delay 0.05)  ;; n秒後に補完開始
;(setq ac-use-fuzzy t)  ;; 曖昧マッチ有効
;(setq ac-use-comphist t)  ;; 補完推測機能有効
;(setq ac-auto-show-menu 0.05)  ;; n秒後に補完メニューを表示
;(setq ac-quick-hel-delay 0.5)  ;; n秒後にクイックヘルを表示
;(setq ac-ignore-case nil)  ;; 大文字・小文字を区別する

;; auto-complete の候補に日本語を含む単語が含まれないようにする
;; http://d.hatena.ne.jp/IMAKADO/20090813/1250130343
;(defadvice ac-word-candidates (after remove-word-contain-japanese activate)
;  (let ((contain-japanese (lambda (s) (string-match (rx (category japanese)) s))))
;    (setq ad-return-value
;          (remove-if contain-japanese ad-return-value))))


;;
;; http://fukuyama.co/emacs-auto-complete
;;

;(defvar ac-dir (expand-file-name "~/.emacs.d/elpa/auto-complete-20140618.2217"))
;(add-to-list 'load-path ac-dir)
;(add-to-list 'load-path (concat ac-dir "/lib/ert"))
;(add-to-list 'load-path (concat ac-dir "/lib/fuzzy"))
;(add-to-list 'load-path (concat ac-dir "/lib/popup"))

(require 'auto-complete)
(require 'auto-complete-config)
(global-auto-complete-mode t)
(define-key ac-completing-map (kbd "TAB") 'ac-complete) ;;TABで補完を完了する

;; C-n / C-p で選択
;; (define-key ac-completing-map (kbd "C-n") 'ac-next)
;; (define-key ac-completing-map (kbd "C-p") 'ac-previous)

(setq ac-use-menu-map t)
;; デフォルトで設定済み
(define-key ac-menu-map "\C-n" 'ac-next)
(define-key ac-menu-map "\C-p" 'ac-previous)

;(setq ac-use-menu-map t) ;; C-n / C-p で選択
(setq ac-auto-show-menu 0.3) ;; 候補が出るまでの時間 default 0.8

;1. 一つしか候補がない時にTAB(ac-expand)すると補完を完了(ac-complete)する
;2. 次候補/前候補を選んだ後にTAB(ac-expand)すると補完を完了(ac-complete)する
;3. 補完後にメニューを自動的に非表示にする
(setq ac-dwim t)


;; ユーザ辞書の場所
(defvar ac-user-dict-dir (expand-file-name "~/.emacs.d/ac-user-dict/"))

;; コンプリート時の動作 - 候補の末尾に()があればその内にカーソルを置く
;(defun ac-go-into-braces-action ()
;  (save-restriction
;    (narrow-to-region (point) (- (point) 2))
;    (if (re-search-backward "()" nil t)
;        (forward-char))))

;; 直前の文字を区別して辞書を使用する - 何か1文字+ドットの後の場合に補完する
;(defun ac-js-dot-prefix ()
;  "`x.' prefix."
;  (if (re-search-backward ".\\.\\(.*\\)" nil t)
;      ;; ".\\.\\(.*\\)" 何か一文字[.] ドット[\\.] 補完開始点[\\(.*\\)]
;      (match-beginning 1)))

;; メニューで選択中の候補の色設定
;(defface ac-my-selection-face
;  '((t (:background "#000080" :foreground "#ffffff")))
;  "Face for selectied candidates."
;  :group 'auto-complete)

;;; 辞書1 (underscore.js)
;; 色設定
;(defface ac-underscore-js-candidate-face
;  '((t (:background "#730CE8" :foreground "#eeeeee")))
;  "Face for underscore.js candidates."
;  :group 'auto-complete)
;; 情報源に辞書ファイルを指定
;(defvar ac-underscore-js-cache
;  (ac-file-dictionary (concat ac-user-dict-dir "underscore-js")))
;; 辞書1の設定
;(defvar ac-source-underscore-js-dict
;  '((candidates . ac-underscore-js-cache) ;; 候補の情報源 これ以下はオプション
;    (candidate-face . ac-underscore-js-candidate-face) ;; 候補の色設定
;    (selection-face . ac-my-selection-face) ;; 選択中の色設定
;    (prefix . ac-js-dot-prefix) ;; 直前の文字の条件
;    (action . ac-go-into-braces-action) ;; 補完後の動作
;    (symbol . "underscore.js") ;; ライブラリ名 (無理矢理。本来の意図とは違うはず)
;    ;; (requires . 2) ;; 補完が開始される最低入力文字数を上書き
;    ;; (limit . 30) ;; 候補を一度に表示する上限数を上書き
;    ))

;;; 辞書2 (jquery)
;; 色設定
;(defface ac-jquery-candidate-face
;  '((t (:background "#1f679a" :foreground "#eeeeee")))
;  "Face for jquery candidates."
;  :group 'auto-complete)
;; 情報源に辞書ファイルを指定
;(defvar ac-jquery-method1-cache
;  (ac-file-dictionary (concat ac-user-dict-dir "jquery-method1")))
;; 辞書2の設定
;(defvar ac-source-jquery-method-dict1
;  '((candidates . ac-jquery-method1-cache)
;    (candidate-face . ac-jquery-candidate-face)
;    (selection-face . ac-my-selection-face)
;    (prefix . ac-js-dot-prefix)
;    (action . ac-go-into-braces-action)
;    (symbol . "jquery method1")
;    ))

;;; 辞書3 (jquery)
;; 直前の文字の条件 (`jQuery.'または`$.')
;(defun ac-jquery-method2-prefix ()
;  "`$' or `jQuery' prefix."
;  (if (re-search-backward "\\(jQuery\\|\\$\\)\\.\\(.*\\)" nil t)
;      (match-beginning 2)))
;; 情報源に辞書ファイルを指定
;(defvar ac-jquery-method2-cache
;  (ac-file-dictionary (concat ac-user-dict-dir "jquery-method2")))
;; 辞書3の設定
;(defvar ac-source-jquery-method-dict2
;  '((candidates . ac-jquery-method2-cache)
;    (candidate-face . ac-jquery-candidate-face)
;    (selection-face . ac-my-selection-face)
;    (prefix . ac-jquery-method2-prefix)
;    (action . ac-go-into-braces-action)
;    (symbol . "jquery method2")
;    ))

;;; 辞書4 (jqueryセレクタ)
;; 直前の文字の条件 (`x:')
;(defun ac-jquery-selector-prefix ()
;  "`x:' prefix."
;  (if (re-search-backward ".\\:\\(.*\\)" nil t)
;      (match-beginning 1)))
;; 色設定
;(defface ac-jquery-selector-candidate-face
;  '((t (:background "#1B919A" :foreground "#eeeeee")))
;  "Face for jquery selector candidates."
;  :group 'auto-complete)
;; 情報源に辞書ファイルを指定
;(defvar ac-jquery-selector-cache
;  (ac-file-dictionary (concat ac-user-dict-dir "jquery-selector")))
;; 辞書4の設定
;(defvar ac-source-jquery-selector-dict
;  '((candidates . ac-jquery-selector-cache)
;    (candidate-face . ac-jquery-selector-candidate-face)
;    (selection-face . ac-my-selection-face)
;    (prefix . ac-jquery-selector-prefix)
;    (action . ac-go-into-braces-action)
;    (symbol . "jQuery selector")
;    ))

;; 使用する辞書・情報源を選択
;(defun ac-js-mode-setup ()
;  (setq ac-sources
;        '(
;          ac-source-abbrev
;          ac-source-words-in-same-mode-buffers
;          ;; ac-source-yasnippet
;          ac-source-filename
;          ;; 優先順位で並べる (prefixを指定すると排他的になる; x.に$.が含まれる)
;          ac-source-jquery-method-dict2  ; prefix `$.'
;          ac-source-jquery-method-dict1  ; prefix `x.'
;          ac-source-underscore-js-dict   ; prefix `x.'
;          ac-source-jquery-selector-dict ; prefix `x:'
;          )))
;; メジャーモードに反映させる
; (add-hook 'js-mode-hook 'ac-js-mode-setup)
; (add-hook 'js2-mode-hook 'ac-js-mode-setup)

;; 辞書間で重複するものが削除されるので
;; ~/.emacs.d/elisp/auto-complete/auto-complete.el L1052 (delete-dups candidates) をコメントアウト

;; ac-disable-facesの初期値は
;; (font-lock-comment-face font-lock-string-face font-lock-doc-face)
;; font-lock-string-faceがあるとクオートで囲まれた部分"..."で
;; auto-completeが反応しなくなり、セレクタを補完できないので次のように
;(setq ac-disable-faces '(font-lock-comment-face font-lock-doc-face))




;;----------------------------------------------------------------
;; #auto-complete-mode for latex
;;


;(require 'auto-complete-latex)
;(setq ac-l-dict-directory "~/.emacs.d/ac-l-dict/")
;(add-to-list 'ac-modes 'latex-mode)
;(add-hook 'latex-mode-hook 'ac-l-setup)
;; for YaTeX
;(when (require 'auto-complete-latex nil t)
;  (setq ac-l-dict-directory "~/.emacs.d/ac-l-dict/")
;  (add-to-list 'ac-modes 'yatex-mode)
;  (add-hook 'yatex-mode-hook 'ac-l-setup))



;; auto-complete-mode for latex light 
(require 'auto-complete-latex-light)
(setq ac-ll-dict-directory "~/.emacs.d/elisp/ac-ll-dict/")
(add-to-list 'ac-modes 'latex-mode)
(add-hook 'latex-mode-hook
	  (lambda ()
	    ;; Set the ac-sources you like.
	    (setq ac-sources
		  '(ac-source-filename
		    ac-source-latex-dictionary
		    ac-source-latex-commands-in-same-mode-buffers
		    ac-source-abbrev
		    ac-source-dictionary
		    ac-source-yasnippet))))
; for YaTeX
(when (require 'auto-complete-latex-light nil t)
  (setq ac-l-dict-directory "~/.emacs.d/elisp/ac-ll-dict/")
  (add-to-list 'ac-modes 'yatex-mode)
  (add-hook 'yatex-mode-hook
	    (lambda ()
	      ;; Set the ac-sources you like.
	      (setq ac-sources
		    '(ac-source-filename
		      ac-source-latex-dictionary
		      ac-source-latex-commands-in-same-mode-buffers
		      ac-source-abbrev
		      ac-source-dictionary
		      ac-source-yasnippet)))))



;;----------------------------------------------------------------
;; #ac-skk
;;
;;補完候補としたい辞書ファイルの場所を指定します。
;(setq ac-skk-jisyo-file "~/.emacs.d/ddskk/jisyo")
;;補完候補生成に必要な中間ファイルを置く場所を指定します。
;(setq ac-skk-alist-file "~/.emacs.d/ac-skk-alist.el")

;(ac-skk-enable)


;;----------------------------------------------------------------
;; #ac-ja
;;
; ac-source-dabbrev-ja
;(require 'ac-ja)
;(setq ac-sources (append ac-sources '(ac-source-dabbrev-ja)))

;;補完候補としたい辞書ファイルの場所を指定します。
;(setq ac-skk-jisyo-file "~/Library/Application\ Support/AquaSKK/SKK-JISYO.L")
;;補完候補生成に必要な中間ファイルを置く場所を指定します。
;(setq ac-skk-alist-file "~/.emacs.d/auto-complete/ac-skk-alist.el") 
;(require 'ac-ja) 
;(setq ac-sources (append ac-sources '(ac-source-skk)))

;(eval-after-load "skk"
;  '(progn
;     (defadvice skk-kakutei (after ad-skk-kakutei last)
;       "skk-kakuteiの後にatuo-complete-modeによる補完を実行するadvice"
;       (unless (minibufferp)
;         (ac-start)))))

;(add-hook 'skk-mode-hook 
;          (lambda () 
;            "skk-kakuteiのadviceを活性化" 
;            (interactive)
;            (ad-activate 'skk-kakutei)))

;(defadvice skk-mode-exit (before ad-skk-mode-exit last)
;       "skk-modeから抜ける時にskk-kakuteiのadviceを不活性化。"
;       (ad-deactivate 'skk-kakutei))


;(eval-after-load "skk"
;  '(progn
;     (defadvice skk-kakutei (after ad-skk-kakutei last)
;       "skk-kakuteiの後にatuo-complete-modeによる補完を実行するadvice"
;       (unless (minibufferp)
;         (ac-start)))))

;(add-hook 'skk-mode-hook 
;          (lambda () 
;            "skk-kakuteiのadviceを活性化" 
;            (interactive)
;            (ad-activate 'skk-kakutei)))

;(defadvice skk-mode-exit (before ad-skk-mode-exit last)
;       "skk-modeから抜ける時にskk-kakuteiのadviceを不活性化。"
;       (ad-deactivate 'skk-kakutei))
