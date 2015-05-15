
;;----------------------------------------------------------------
;; #yasnippet
;;
(require 'cl)
;; 問い合わせを簡略化 yes/no を y/n
(fset 'yes-or-no-p 'y-or-n-p)

;; yasnippetを置いているフォルダにパスを通す
;(add-to-list 'load-path
;	     (expand-file-name "~/.emacs.d/site-lisp/yasnippet"))
(require 'yasnippet)
;; ~/.emacs.d/にsnippetsというフォルダを作っておきましょう
(setq yas-snippet-dirs
      '("~/.emacs.d/snippets" ;; 作成するスニペットはここに入る
	"~/.emacs.d/elpa/yasnippet/snippets" ;; 最初から入っていたスニペット(省略可能)
	))
(yas-global-mode 1)

;; 単語展開キーバインド (ver8.0から明記しないと機能しない)
;; (setqだとtermなどで干渉問題ありでした)
;; もちろんTAB以外でもOK 例えば "C-;"とか
(custom-set-variables '(yas-trigger-key "TAB"))

;; 既存スニペットを挿入する
(define-key yas-minor-mode-map (kbd "C-x i i") 'yas-insert-snippet)
;; 新規スニペットを作成するバッファを用意する
(define-key yas-minor-mode-map (kbd "C-x i n") 'yas-new-snippet)
;; 既存スニペットを閲覧・編集する
(define-key yas-minor-mode-map (kbd "C-x i v") 'yas-visit-snippet-file)
