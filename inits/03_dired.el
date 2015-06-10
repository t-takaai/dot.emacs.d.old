
;;----------------------------------------------------------------
;; #dired
;;
;; dired-modeの色づけ
;(defvar *original-dired-font-lock-keywords* dired-font-lock-keywords)
;(defun dired-highlight-by-extensions (highlight-list)
;  "highlight-list accept list of (regexp [regexp] ... face)."
;  (let ((lst nil))
;    (dolist (highlight highlight-list)
;      (push `(,(concat "\\.\\(" (regexp-opt (butlast highlight)) "\\)$")
;              (".+" (dired-move-to-filename)
;               nil (0 ,(car (last highlight)))))
;            lst))
;    (setq dired-font-lock-keywords
;          (append *original-dired-font-lock-keywords* lst))))
;(dired-highlight-by-extensions
;  '(("txt" font-lock-variable-name-face)
;    ("odql" "tmpl" font-lock-type-face)
;    ("lisp" "el" "pl" font-lock-constant-face)))

;; emacsでls does not support –dired; see `dired-use-ls-dired’ for more details.と出たときの対処方法
;; # http://niku.name/articles/2013/04/30/emacs%E3%81%A7ls%20does%20not%20support%20--dired;%20see%20%60dired-use-ls-dired%27%20for%20more%20details.%E3%81%A8%E5%87%BA%E3%81%9F%E3%81%A8%E3%81%8D%E3%81%AE%E5%AF%BE%E5%87%A6%E6%96%B9%E6%B3%95
(setq dired-use-ls-dired t)

;; Listing directory failed but access-file worked エラーの解消
;;http://d.hatena.ne.jp/billest/20100930/1285809840
(when (eq system-type 'darwin)
  (require 'ls-lisp)
  (setq ls-lisp-use-insert-directory-program nil))


;;----------------------------------------------------------------
;; #wdired
;;
(require 'wdired)
(define-key dired-mode-map "r" 'wdired-change-to-wdired-mode)
(setq wdired-allow-to-change-permissions t)




;;----------------------------------------------------------------
;; dired の fキーで、指定した拡張子のファイルを OS で直接開く
;; http://www49.atwiki.jp/ntemacs/pages/19.html
;;

;; OSタイプ を調べる function
(defun os-type ()
  (let ((os-type (shell-command-to-string "uname")))
    (cond ((string-match "CYGWIN" os-type)
           "win")
          ((string-match "Linux" os-type)
           "linux")
          ((string-match "Darwin" os-type)
           "mac"))))

;; OS でファイル、ディレクトリ、URL を直接開くためのコマンドを決定する function
(defun os-open-command-name ()
  (let ((os-type (os-type)))
    (if os-type
        (let ((command-name-list
               (cond ((string= "win" os-type)
                      '("cygstart"))
                     ((string= "linux" os-type)
                      '("xdg-open" "gnome-open"))
                     ((string= "mac" os-type)
                      '("open")))))
          (catch 'loop
            (dolist (command-name command-name-list)
              (unless (string=  (shell-command-to-string
                                 (concat "which " command-name " 2> /dev/null"))
                                "")
                (throw 'loop command-name))))))))

;; OS で直接、ファイル、ディレクトリ、URL を開く command
(defun os-open-command (filename)
  (interactive)
  (let* ((default-directory (if (file-regular-p filename)
                                (file-name-directory filename)
                              default-directory))
         (localname (if (file-remote-p filename)
                        (tramp-file-name-localname
                         (tramp-dissect-file-name filename))
                      filename))
         (os-open-command-name (os-open-command-name)))
    (when os-open-command-name
      (cond ((and (string= os-open-command-name "xdg-open")
                  (not (file-remote-p default-directory)))
             ;; 以下の URL の対策を行う
             ;; http://d.hatena.ne.jp/mooz/20100915/p1
             ;; http://i-yt.info/?date=20090829#p01
             (let (process-connection-type)
               (start-process "os-open-command" nil os-open-command-name localname)))
            (t
             ;; リモートでもコマンドを実行できるように、start-process ではなく shell-command系を使う
             (shell-command-to-string (concat os-open-command-name " "
                                              (shell-quote-argument localname) " &"))))
      (message "%s" (concat os-open-command-name " " localname)))))


;; ;; dired で W 押下時に、カーソル位置のファイルを OS で直接起動する
;; (define-key dired-mode-map (kbd "W")
;;   (lambda ()
;;     (interactive)
;;     (os-open-command (dired-get-filename nil t))))

;; ;; dired で E 押下時に、開いているディレクトリを OS で直接開く
;; (define-key dired-mode-map (kbd "E")
;;   (lambda ()
;;     (interactive)
;;     (os-open-command (dired-current-directory))))


(require 'recentf)
(recentf-mode 1)
;;アイドルタイマーを利用して .recentf ファイルを自動的に保存する。
;; http://d.hatena.ne.jp/tomoya/20110217/1297928222
(when (require 'recentf nil t)
  (setq recentf-max-saved-items 2000)
  (setq recentf-exclude '(".recentf"))
  (setq recentf-auto-cleanup 10)
  (setq recentf-auto-save-timer
        (run-with-idle-timer 30 t 'recentf-save-list))
  (recentf-mode 1))

;; OS で起動したいファイルの拡張子一覧
(setq os-open-file-suffixes '("doc" "docx"
                              "xls" "xlsx"
                              "ppt" "pptx"
                              "mdb" "mdbx"
                              "vsd" "vdx" "vsdx"
                              "mpp"
                              "pdf"
                              "bmp" "jpg"
                              "odt" "ott"
                              "odg" "otg"
                              "odp" "otp"
                              "ods" "ots"
                              "odf"
                              "wtp"
                              ))

;; OS で直接開きたいファイルかどうかを判定する述語 function
(defun os-open-file-p (file)
  (if (file-regular-p file)
      (let ((ext (file-name-extension file)))
        (if (and ext
                 (member (downcase ext) os-open-file-suffixes)
                 (os-open-command-name))
            t))))

;; dired でファイルを f で開く際に、os-open-file-suffixes リストに指定してあるサフィックスのファイルは、
;; OS で直接起動する
(defadvice find-file (around ad-find-file-os-open-command-setup activate)
  (let ((file (ad-get-arg 0)))
    (cond ((os-open-file-p file)
           (recentf-push file) ; recentf に追加する
           (os-open-command file))
          (t
           ad-do-it))))


;;----------------------------------------------------------------
;; # dired-subtree
;;http://rubikitch.com/2014/12/22/dired-subtree/
(require 'dired-subtree)
;;; iを置き換え
(define-key dired-mode-map (kbd "i") 'dired-subtree-insert)
;;; org-modeのようにTABで折り畳む
(define-key dired-mode-map (kbd "<tab>") 'dired-subtree-remove)
;;; C-x n nでsubtreeにナローイング
(define-key dired-mode-map (kbd "C-x n n") 'dired-subtree-narrow)


;;----------------------------------------------------------------
;; # dired-filter.el
;; http://rubikitch.com/2015/04/07/dired-filter/
;; http://qiita.com/ballforest/items/0ddbdfeaa9749647b488

;; dired-modeでonにする
(defun dired-mode-hooks()
	(dired-filter-mode))
(add-hook 'dired-mode-hook 'dired-mode-hooks)
