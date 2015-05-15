
;;----------------------------------------------------------------
;; color-moccur
;;
;;; color-moccur.elの設定

;; (require 'color-moccur)
;; ;; 複数の検索語や、特定のフェイスのみマッチ等の機能を有効にする
;; ;; 詳細は http://www.bookshelf.jp/soft/meadow_50.html#SEC751
;; (setq moccur-split-word t)
;; ;; migemoがrequireできる環境ならmigemoを使う
;; (when (require 'migemo nil t) ;第三引数がnon-nilだとloadできなかった場合にエラーではなくnilを返す
;;   (setq moccur-use-migemo t))

;;http://nya-0.hatenablog.com/entry/2014/06/07/190016

;; color-moccurの設定
(when (require 'color-moccur nil t)
;;M-oにoccur-by-moccurを割り当て
(define-key global-map (kbd "M-o") 'occur-by-moccur)
;;スペース区切りでAND検索
(setq moccur-split-word t)
;;ディレクトリ検索するときの除外ファイル
(add-to-list 'dmoccur-exclusion-mask "\\.DS_Store")
(add-to-list 'dmoccur-exclusion-mask "^#.+#$")
;;Migemoを利用できる環境であればMigemoを使う
(when (and (executable-find "/usr/local/bin/cmigemo") ;;このパスも、自分の環境に合わせて変更してください
     (require 'migemo nil t))
(setq moccur-use-migemo t)))

(global-set-key "\C-c\C-g" 'moccur-grep-find)

;; moccur-editの設定
(require 'moccur-edit nil t)
