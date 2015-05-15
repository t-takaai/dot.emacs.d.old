
;;----------------------------------------------------------------
;; #dash-at-point
;;
;;  https://github.com/stanaka/dash-at-point 
;;
(autoload 'dash-at-point "dash-at-point"
          "Search the word at point with Dash." t nil)
(global-set-key "\C-cd" 'dash-at-point)
(global-set-key "\C-ce" 'dash-at-point-with-docset)
(add-to-list 'dash-at-point-mode-alist '(yatex-mode . "latex"))


;;----------------------------------------------------------------
;; #magit
;;
(require 'magit)


;;----------------------------------------------------------------
;; #uniqify
;;
(require 'uniquify)
;; set buffer name to 'filename<dir>'
(setq uniquify-buffer-name-style 'post-forward-angle-brackets)
;; *で囲まれたバッファ名は対象外にする
(setq uniquify-ignore-buffers-re "*[^*]+*")


;;----------------------------------------------------------------
;; #recentf
;;
;; preserv recent 2000 files
(setq recentf-max-saved-items 2000)
;; exclueded regular expression
(setq recentf-exclude '("/TAGS$" "/var/tmp/"))
(require 'recentf-ext)
(global-set-key "\C-xp" 'recentf-open-files)


;;----------------------------------------------------------------
;; #cua-mode
;;
(cua-mode t)
(setq cua-enable-cua-keys nil) ;; 変なキーバインド禁止


;;----------------------------------------------------------------
;; #sticky
;;
;(require 'sticky)
;(use-sticky-key ";" sticky-alist:en)


;;----------------------------------------------------------------
;; #php-auto-yasnippets
;;
;; (require 'php-auto-yasnippets)
;; (define-key php-mode-map (kbd "C-c C-y") 'yas/create-php-snippet)



;;----------------------------------------------------------------
;; #dayone
;;
;; Day One のデータを配置している directory への path を格納します。必ずあなたの設定ファイルで設定して下さい。
(setq dayone-dir (concat (getenv "HOME") "/Dropbox/Apps/Day One/Journal.dayone/entries/"))
;; Day One のノートの XML で指定するタイムゾーンの値を格納します。
(setq dayone-timezone "Japan/Tokyo")


;;----------------------------------------------------------------
;; #google-maps
;;
;(require 'google-maps)


;;----------------------------------------------------------------
;; #scala-mode2
;;
(require 'scala-mode2)


;;----------------------------------------------------------------
;; #ENSIME
;;
(require 'ensime)
(add-hook 'scala-mode-hook 'ensime-scala-mode-hook)


;;----------------------------------------------------------------
;; #mew
;;
(autoload 'mew "mew" nil t)
(autoload 'mew-send "mew" nil t)
;(setq mew-fcc "+outbox") ; 送信メールを保存
 
;; Optional setup (Read Mail menu):
(setq read-mail-command 'mew)
 
;; Optional setup (e.g. C-xm for sending a message):
(autoload 'mew-user-agent-compose "mew" nil t)
(if (boundp 'mail-user-agent)
    (setq mail-user-agent 'mew-user-agent))
(if (fboundp 'define-mail-user-agent)
    (define-mail-user-agent
      'mew-user-agent
      'mew-user-agent-compose
      'mew-draft-send-message
      'mew-draft-kill
      'mew-send-hook))


;;----------------------------------------------------------------
;; #jabber
;;
(require 'jabber)
(setq  jabber-account-list 
(quote(("takoyaj@gmail.com" ;自分のアドレス
(:password . "qzfoaujvkttnjnti") ;アプリケーション固有パスワード
(:network-server . "talk.google.com")
(:connection-type . ssl)))))


;;----------------------------------------------------------------
;; #Edit with Emacs (Google Chrome Extension)
;;
(require 'edit-server)
(edit-server-start)
(setq edit-server-new-frame nil)



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
;; key-chord
;;
(require 'key-chord)
(setq key-chord-two-keys-delay 0.04)
(key-chord-mode 1)
;;同時押しでview-modeをトグル
(key-chord-define-global "jk" 'view-mode)


;;----------------------------------------------------------------
;; undo-tree
;;
(require 'undo-tree)
(global-undo-tree-mode t)
(global-set-key (kbd "M-/") 'undo-tree-redo)



;;----------------------------------------------------------------
;; nav
;;
;; (require 'nav)
;; (setq nav-split-window-direction 'vertical) ;; 分割したフレームを垂直に並べる
;; (global-set-key "\C-x\C-d" 'nav-toggle)     ;; C-x C-d で nav をトグル

;; (nav-disable-overeager-window-splitting)
;; (custom-set-variables
;;  '(nav-width 12))
;;  
;; (defun nav-mode-hl-hook ()
;;   (local-set-key (kbd "<right>") 'nav-open-file-under-cursor)
;;   (local-set-key (kbd "<left>")  'nav-go-up-one-dir)
;;   )
;;  
;; (add-hook 'nav-mode-hook 'nav-mode-hl-hook)
;; (add-hook 'emacs-startup-hook
;;           (lambda ()
;;             (nav-toggle-hidden-files)
;;             ))


;;----------------------------------------------------------------
;; popwin
;; http://d.hatena.ne.jp/m2ym/20110120/1295524932
;;
(require 'popwin)
(setq display-buffer-function 'popwin:display-buffer)
(setq popwin:popup-window-position 'bottom)
(push '("*YaTeX-typesetting*") popwin:special-display-config)
(push '("helm" :regexp t :height 0.4) popwin:special-display-config)



;;----------------------------------------------------------------
;; pdf-tools
;; "The epdfinfo server quit, restart it?" と言われて機能せず

;(pdf-tools-install)

;(require 'pdf-tools)
;(require 'pdf-annot) 
;(require 'pdf-history) 
;(require 'pdf-info) 
;(require 'pdf-isearch) 
;(require 'pdf-links) 
;(require 'pdf-misc) 
;(require 'pdf-occur) 
;(require 'pdf-outline) 
;(require 'pdf-render) 
;(require 'pdf-sync) 
;(require 'tablist-filter)
;(require 'tablist)


;; ;;----------------------------------------------------------------
;; ;; direx
;; ;; http://cx4a.blogspot.jp/2011/12/popwineldirexel.html
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




;;----------------------------------------------------------------
;; smart-compile
;; http://ka-zoo.net/2013/03/smartcompile-emacs%E3%81%8B%E3%82%89ruby%E3%82%92%E7%9B%B4%E6%8E%A5%E5%AE%9F%E8%A1%8C/
;; in smart-compile.el
;; ("\\.pl\\'"         . "perl -cw %f")
;; ;;  ("\\.rb\\'"         . "ruby -cw %f")
;; ("\\.rb\\'"         . "ruby %f")
(require 'smart-compile)
(define-key ruby-mode-map (kbd "C-c c") 'smart-compile)
(define-key ruby-mode-map (kbd "C-c C-c") (kbd "C-c c C-m"))
(setq compilation-window-height 15) ;; default window height is 15




;;----------------------------------------------------------------
;; # guide-key
;; http://www.kaichan.info/blog/2012-12-03-emacs-advent-calendar-2012-03.html

(require 'guide-key)
(setq guide-key/guide-key-sequence '("C-x r" "C-x 4" "C-c" "C-z"))
(guide-key-mode 1)  ; guide-key-mode を有効にする


;;----------------------------------------------------------------
;; # eldoc
;;
(add-hook 'emacs-lisp-mode-hook '(lambda ()
				   (require 'eldoc-extension)
				   (eldoc-mode t)
				   ))
(add-hook 'eval-expression-minibuffer-setup-hook 'eldoc-mode)

;;----------------------------------------------------------------
;; # php-eldoc
;; https://github.com/sabof/php-eldoc
;; (defun php-mode-options ()
;;   (php-eldoc-enable)
;;   (cond
;;     ((string-match-p "^/my-project-folder")
;;      (php-eldoc-probe-load "http://my-project.com/probe.php?secret=sesame"))
;;     ((string-match-p "^/other-project-folder")
;;      (php-eldoc-probe-load "http://localhost/otherproject/probe.php?secret=sesame"))))
;; (add-hook 'php-mode-hook 'php-mode-options)


;;----------------------------------------------------------------
;; # jumar (https://github.com/kenoss/jumar) 
;; http://qiita.com/kenoss/items/0617b0c2f04343d4477c
(require 'jumar)
(require 'jumar-dwin)
(require 'helm)  ; if you use visualizer.

;; If one needs highlight the line after jump.
(require 'erfi-emacs)
(add-hook 'jumar-post-jump-hook 'erfi-emacs-hl-turn-on-until-next-command)

;; Initialization
(jumar-dwin-use-preconfigured-scheme 'list+history)
(jumar-init)

;; As you like.
(define-key global-map (kbd "C-'")     'jumar-dwin-add-marker)
(define-key global-map (kbd "C-\"")    'jumar-dwin-jump-current)
(define-key global-map (kbd "C-,")     'jumar-dwin-jump-backward)
(define-key global-map (kbd "C-.")     'jumar-dwin-jump-forward)
(define-key global-map (kbd "C-x C-'") 'helm-jumar-dwin-jumarkers)

;; As you need.  Advise jump commands, like `find-tag' and `gtags-find-tag',
;; to add jumarker before/after jump.
(jumar-dwin-advise-jump-command-to-add-jumarker 'find-tag)
; (jumar-dwin-advise-jump-command-to-add-jumarker 'elisp-slime-nav-find-elisp-thing-at-point)


;;----------------------------------------------------------------
;; expand region
;; er/expand-regionを実行する度にリージョンの範囲が広がっていく
;; http://d.hatena.ne.jp/syohex/20120117/1326814127
(require 'expand-region)
(global-set-key (kbd "C-\`") 'er/expand-region)
(global-set-key (kbd "C-M-\`") 'er/contract-region) ;; リージョンを狭める

;; transient-mark-modeが nilでは動作しませんので注意
(transient-mark-mode t)


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


;;----------------------------------------------------------------
;; googl.el
;;
;(load "google")


;;----------------------------------------------------------------
;; search-web
;; http://qiita.com/akisute3@github/items/8deb54b75b48e8b04cb0
;;(require 'search-web)

(defvar search-engines
  '(("s" . "http://reference.sitepoint.com/search?q=%s")
	("g" . "http://www.google.com/search?q=%s")
	("gj" . "http://www.google.com/search?hl=ja&q=%s")
	("ge" . "http://www.google.com/search?hl=en&q=%s")
	("m" . "http://maps.google.co.jp/maps?hl=ja&q=%s")
	("y" . "http://search.yahoo.co.jp/search?p=%s")
	("yt" . "http://www.youtube.com/results?search_type=&search_query=%s&aq=f")
	("tw" . "http://search.twitter.com/search?q=%s")
	("goo" . "http://dictionary.goo.ne.jp/srch/all/%s/m0u/")
	("a" . "http://www.answers.com/topic/%s")
	("ew" . "http://www.google.com/cse?cx=004774160799092323420%%3A6-ff2s0o6yi&q=%s&sa=Search")
	("eow" . "http://eow.alc.co.jp/%s/UTF-8/")
	("z" . "http://www.amazon.com/s/url=search-alias%%3Daps&field-keywords=%s")
	("zj" . "http://www.amazon.co.jp/gp/search?index=blended&field-keywords=%s")
	("y" . "http://search.yahoo.com/search?p=%s")
	("yj" . "http://search.yahoo.co.jp/search?p=%s")
	("we" . "http://www.wikipedia.org/search-redirect.php?search=%s&language=en")
	("wj" . "http://www.wikipedia.org/search-redirect.php?search=%s&language=ja"))
  "A list is search engines list. keys engines nick, and value is search engine query.
Search word %s. In formatting url-hexify. Use %% to put a single % into output.")

(defun search-web (engine word)
  (browse-url
   (format (cdr (assoc engine search-engines)) (url-hexify-string word))))

(defun search-web-at-point (engine)
  "search web search engine for word on cursor.
arg is search-engines keys."
  (interactive "sSearch engine: ")
  (search-web engine (substring-no-properties (thing-at-point 'word))))

(defun search-web-region (engine)
  (interactive "sSearch engine: ")
  (let ((beg (mark))
        (end (point)))
	(search-web engine (buffer-substring-no-properties beg end))))

;; (defun search-web-sc (start end)
;; (interactive "r")
;; (if mark-active
;;     (search-web-region :start start :end end)
;;   (search-web-at-point)))

(define-prefix-command 'search-web-map)
(global-set-key (kbd "C-q") 'search-web-map)
(global-set-key (kbd "C-q g") (lambda () (interactive) (search-web-at-point "g")))
(global-set-key (kbd "C-q r") (lambda () (interactive) (search-web-region "g")))
;(global-set-key (kbd "C-q g") (lambda () (interactive) (search-web-sc "g")))


;;----------------------------------------------------------------
;; quickrun
;;
(require 'quickrun)
(push '("*quickrun*") popwin:special-display-config)

;; region選択されていたら quickrun-region されていなかったら quickrun を実行する。
;; http://yunojy.github.io/blog/2013/03/17/emacs-de-quickrun-or-quickrun-region/
(defun quickrun-sc (start end)
(interactive "r")
(if mark-active
    (quickrun :start start :end end)
  (quickrun)))
(global-set-key (kbd "<f5>") 'quickrun-sc)


;;----------------------------------------------------------------
;; Re-open read-only files as root automagically
;; https://tsdh.wordpress.com/2008/08/20/re-open-read-only-files-as-root-automagically/

(defun th-rename-tramp-buffer ()
  (when (file-remote-p (buffer-file-name))
    (rename-buffer
     (format "%s:%s"
             (file-remote-p (buffer-file-name) 'method)
             (buffer-name)))))

(add-hook 'find-file-hook
          'th-rename-tramp-buffer)

(defadvice find-file (around th-find-file activate)
  "Open FILENAME using tramp's sudo method if it's read-only."
  (if (and (not (file-writable-p (ad-get-arg 0)))
           (y-or-n-p (concat "File "
                             (ad-get-arg 0)
                             " is read-only.  Open it as root? ")))
      (th-find-file-sudo (ad-get-arg 0))
    ad-do-it))

(defun th-find-file-sudo (file)
  "Opens FILE with root privileges."
  (interactive "F")
  (set-buffer (find-file (concat "/sudo::" file))))

;;----------------------------------------------------------------
;; sql-index
(eval-after-load "sql"
  '(load-library "sql-indent"))
(setq sql-indent-offset 2)
