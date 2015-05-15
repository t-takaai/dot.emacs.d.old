
;;----------------------------------------------------------------
;; #skk
;;
(setq skk-user-directory "~/.emacs.d/ddskk/") ; ディレクトリ指定
(require 'skk-autoloads)
;(global-set-key "\C-xt" 'skk-tutorial)

;; SKK を起動する
(global-set-key "\M-`" 'my-skk-mode)

;; ~/.skk にいっぱい設定を書いているのでバイトコンパイルしたい
(setq skk-byte-compile-init-file t)

(defun skk-mode-start ()
  (key-combo-mode 1)
  (skk-mode))

(defun skk-mode-stop ()
  (key-combo-mode 0)
  (skk-mode))

(define-minor-mode my-skk-mode
  (if my-skk-mode
      (skk-mode-start)
    (skk-mode-stop)))

(setq skk-sticky-key ";")

;; (add-hook 'skk-mode-hook
;;   '(lambda ()
;;     (key-combo-mode 0)))


;; sticky
;; e として， Shift キーを使わずに設定
;; http://homepage1.nifty.com/blankspace/emacs/sticky.html
;; (defvar sticky-key ";")
;; (defvar sticky-list
;;   '(
;;     ("a" . "A") ("b" . "B") ("c" . "C") ("d" . "D") ("e" . "E") ("f" . "F") ("g" . "G")
;;     ("h" . "H") ("i" . "I") ("j" . "J") ("k" . "K") ("l" . "L") ("m" . "M") ("n" . "N")
;;     ("o" . "O") ("p" . "P") ("q" . "Q") ("r" . "R") ("s" . "S") ("t" . "T") ("u" . "U")
;;     ("v" . "V") ("w" . "W") ("x" . "X") ("y" . "Y") ("z" . "Z")
;;     ("1" . "!") ("2" . "\"") ("3" . "#") ("4" . "$") ("5" . "%") ("6" . "&") ("7" . "'")
;;     ("8" . "(") ("9" . ")") ("0" . "~")
;;     ("@" . "`") ("[" . "{") ("]" . "}") ("-" . "=") (":" . "*") ("," . "<") ("." . ">")
;;     ("/" . "?") (";" . "+") ("\\" . "|") ("^" . "_")
;;     ))
;; (defvar sticky-map (make-sparse-keymap))
;; (define-key global-map sticky-key sticky-map)
;; (mapcar (lambda (pair)
;;           (define-key sticky-map (car pair)
;;             `(lambda() (interactive)
;;                (setq unread-command-events
;;                      (cons , (string-to-char (cdr pair)) unread-command-events)))))
;;         sticky-list)
;; (define-key sticky-map sticky-key '(lambda () (interactive) (insert sticky-key)))
;; (add-hook 'skk-mode-hook
;;           (lambda ()
;;             (progn
;;               (define-key skk-j-mode-map sticky-key sticky-map)
;;               (define-key skk-jisx0208-latin-mode-map sticky-key sticky-map)
;;               (define-key skk-abbrev-mode-map sticky-key sticky-map)
;;               )
;;             ))

;;
;; SKKで「かなモード」のときに「$」を入力すると自動的に「アスキーモード」に切り替える
;;
;; in yatex.el
;;
;; (defun YaTeX-insert-dollar ()
;;   (interactive)
;;   (if (or (not (YaTeX-closable-p))
;; 	  (= (preceding-char) 92)
;; 	  (and (YaTeX-in-math-mode-p)
;; 	       (or (/= (preceding-char) ?$) (/= (following-char) ?$))))
;;       (insert "$")
;;     (insert "$$")
;;     (forward-char -1)
;;     (YaTeX-jmode-off)
;;     (key-combo-mode 1) ;;ここに手を加えてある
;;     (or YaTeX-auto-math-mode YaTeX-math-mode (YaTeX-toggle-math-mode 1))))

(add-hook 'skk-mode-hook
         (lambda ()
           (if (eq major-mode 'yatex-mode)
               (progn
                 (define-key skk-j-mode-map "¥¥" 'self-insert-command)
                 (define-key skk-j-mode-map "$" 'YaTeX-insert-dollar)
                 (define-key skk-j-mode-map (kbd "M-SPC") 'YaTeX-insert-dollar)
                 ))
           ))


;; (setq skk-mode-hook
 ;; 		 '(lambda ()
 ;; 		    (if (eq major-mode 'yatex-mode)
 ;; 			(define-key skk-map "$" 'YaTeX-insert-dollar)
 ;; 		      (define-key skk-map "$" 'skk-self-insert))
 ;; 		    (define-key skk-map "\C-x$"
 ;; 		      'skk-display-code-for-char-at-point)))

; 送り仮名が厳密に正しい候補を優先して表示
(setq skk-henkan-strict-okuri-precedence t)
; 漢字登録時、送り仮名が厳密に正しいかをチェック
(setq skk-check-okurigana-on-touroku t)
; AquaSKK と辞書の共有
;(setq skk-server-host "localhost")
;(setq skk-server-portnum 1178)
; 句点、読点変更
;(setq-default skk-kutouten-type 'en)
; 
(setq skk-dcomp-multiple-activate t)

;; YaTeX のときだけ句読点を変更したい
(add-hook 'yatex-mode-hook
	  (lambda ()
	    (require 'skk)
	    (setq skk-kutouten-type 'en)))

;; チュートリアルファイルの指定
(setq skk-tut-file "~/.emacs.d/share/skk/SKK.tut")

;; Emacs 起動時に SKK を前もってロードする
(setq skk-preload t)

;;C-c b でアンドゥ確定
;(add-hook 'skk-mode-hook 
;          (lambda ()
;            (define-key skk-j-mode-map "\C-cb" 'skk-undo-kakutei)
;            ))
;;コメント行を抜けたらasciiにする。
;(add-hook 'skk-load-hook
;          (lambda ()
;            (require 'context-skk)))

;;----------------------------------------------------------------
;; google-ime-skk
;; https://github.com/akiym/go-skkserv
;; http://sleepboy-zzz.blogspot.jp/
;; (require 'skk-server)

;; (setq skk-server-host "0.0.0.0"
;;       skk-server-prog "~/bin/google_ime_skk" ; ビルドしたgo-skkservへのパス
;;       skk-server-portnum 55100)

;; (defun my/boot-skk-server ()
;;   "Start SKK server."
;;   (unless (skk-server-live-p)
;;     (async-shell-command skk-server-prog (get-buffer-create "*goskk*"))
;;     (setq skkserv-process (skk-open-server-1))
;;     (when (skk-server-live-p)
;;       (set-process-coding-system skkserv-process 'utf-8 'utf-8))))

;; (defun my/skk-close-server ()
;;   (interactive)
;;   (when (skk-server-live-p)
;;     (skk-disconnect-server)
;;     (kill-process (get-buffer-process "*goskk*"))
;;     (message "Server disconnected")))

;; (add-hook 'kill-emacs-hook 'my/skk-close-server)


