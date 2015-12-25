
;;----------------------------------------------------------------
;; #helm
;;
(require 'helm)
(require 'helm-ag)
(require 'helm-descbinds)
(require 'helm-config)
(require 'helm-mode)

(helm-mode 1)

(helm-descbinds-mode)

;; helm版read-file-nameを標準のEmacsのものに戻す
;; http://rubikitch.com/2014/08/11/helm-avoid-find-files/
;; (defadvice helm-mode (around avoid-read-file-name activate)
;;   (let ((read-file-name-function read-file-name-function)
;;         (completing-read-function completing-read-function))
;;     ad-do-it))
;; (setq completing-read-function 'my-helm-completing-read-default)
;; (defun my-helm-completing-read-default (&rest _)
;;   (apply (cond ;; [2014-08-11 Mon]helm版のread-file-nameは重いからいらない
;;           ((eq (nth 1 _) 'read-file-name-internal)
;;            'completing-read-default)
;;           (t
;;            'helm--completing-read-default))
;;          _))

(global-set-key (kbd "C-;") 'helm-mini)
(global-set-key (kbd "C-c h") 'helm-mini)
(global-set-key (kbd "C-c b") 'helm-descbinds)
(global-set-key (kbd "C-c o") 'helm-occur)
(global-set-key (kbd "C-c g") 'helm-ag)
(global-set-key (kbd "C-c y") 'helm-show-kill-ring)
(global-set-key (kbd "C-c p") 'helm-recentf)
(global-set-key (kbd "M-y") 'helm-show-kill-ring)
(global-set-key (kbd "C-x C-b") 'helm-for-files)

(define-key global-map (kbd "M-x") 'helm-M-x)

;; For find-file etc.
(define-key helm-read-file-map (kbd "TAB") 'helm-execute-persistent-action)
;; For helm-find-files etc.
(define-key helm-find-files-map (kbd "TAB") 'helm-execute-persistent-action)
;; Emulate `kill-line' in helm minibuffer
(setq helm-delete-minibuffer-contents-from-point t)
(defadvice helm-delete-minibuffer-contents (before helm-emulate-kill-line activate)
  "Emulate `kill-line' in helm minibuffer"
  (kill-new (buffer-substring (point) (field-end))))
(define-key helm-map (kbd "C-h") 'delete-backward-char)
;; (define-key helm-find-files-map (kbd "C-h") 'delete-backward-char)


;;
;; http://fukuyama.co/nonexpansion
;;
;; 自動補完を無効
(custom-set-variables '(helm-ff-auto-update-initial-value nil))
;; C-hでバックスペースと同じように文字を削除  
;; (define-key helm-c-read-file-map (kbd "C-h") 'delete-backward-char)
(define-key helm-find-files-map (kbd "C-h") 'delete-backward-char)


(add-to-list 'helm-completing-read-handlers-alist '(find-file . nil))
(add-to-list 'helm-completing-read-handlers-alist '(dired-do-copy . nil))
(add-to-list 'helm-completing-read-handlers-alist '(dired-do-rename . nil))
(add-to-list 'helm-completing-read-handlers-alist '(dired-create-directory . nil))
(add-to-list 'helm-completing-read-handlers-alist '(dired . nil))
;; (add-to-list 'helm-completing-read-handlers-alist '(write-file . nil))

;; for helm-migemo
(require 'helm-migemo)
(setq helm-use-migemo)

;; C-x C-v C-k C-g で現在のファイル名をコピーしたい
;; Disable helm in some functions
;; http://d.hatena.ne.jp/a_bicky/20140104/1388822688
(add-to-list 'helm-completing-read-handlers-alist '(find-alternate-file . nil))
;; find-file や write-file のインタフェースが気に食わない場合は次の内容も追加すると良いと思います。
(add-to-list 'helm-completing-read-handlers-alist '(find-file . nil))
(add-to-list 'helm-completing-read-handlers-alist '(write-file . nil))

;;  C-x C-f でタブ補完（選択）できない
;; Helm はタブに helm-select-action が割り当てられているので、基本的にファイル名を補完する目的でタブを押しても意味が
;;ありません。
;; タブでファイル名を補完したい場合はタブに helm-execute-persistent-action（C-z を押した時に実行されるコマンド）を割り当てておきます。
;; http://d.hatena.ne.jp/a_bicky/20140104/1388822688
;; For find-file etc.
(define-key helm-read-file-map (kbd "TAB") 'helm-execute-persistent-action)
;;For helm-find-files etc.
(define-key helm-find-files-map (kbd "TAB") 'helm-execute-persistent-action)
;;For find-file etc.
(define-key helm-map (kbd "C-i") 'helm-select-action)


;;----------------------------------------------------------------
;; #helm-ag-r
;; http://sleepboy-zzz.blogspot.jp/2013/10/emacsaghelmhelm-ag-r_4267.html
(require 'helm-ag-r)
(setq
 helm-ag-r-google-contacts-user "takoyaj@gmail.com"
 helm-ag-r-google-contacts-lang "ja_JP.UTF-8"
 ;;agのオプションを指定します。C-oで次のオプションに移動します。 C-rで逆にオプションを移動
 helm-ag-r-option-list '("-S -U --hidden"
                         "-S -U -g")
 ;; 不安定な場合以下の項目を調整すれば
 ;; よくなるかもしれません
 helm-ag-r-requires-pattern 3    ; 文字数以上入力してから検索
 helm-ag-r-input-idle-delay 0.5  ; 検索をdelay後からおこなう
 helm-ag-r-use-no-highlight t    ; ハイライト無効化
 helm-ag-r-candidate-limit 1000) ; 候補の上限を設定

(global-set-key (kbd "C-x C-g") 'helm-ag-r)



;;----------------------------------------------------------------
;; #helm-swoop
;;
;; helm from https://github.com/emacs-helm/helm
;; helm-swoopを使うためにはhelmが必要です
(require 'helm)

;; ;; http://rubikitch.com/category/helm/
;; ;; 141225040059.helm-swoop.1.el
;; ;; この前にmigemoの設定が必要
;; (require 'helm-migemo)
;; ;; この修正が必要
;; (eval-after-load "helm-migemo"
;;   '(defun helm-compile-source--candidates-in-buffer (source)
;;      (helm-aif (assoc 'candidates-in-buffer source)
;;          (append source
;;                  `((candidates
;;                     . ,(or (cdr it)
;;                            (lambda ()
;;                              ;; Do not use `source' because other plugins
;;                              ;; (such as helm-migemo) may change it
;;                              (helm-candidates-in-buffer (hel m-get-current-source)))))
;;                    (volatile) (match identity)))
;;        source)))


(require 'helm-swoop)
;; isearchからの連携を考えるとC-r/C-sにも割り当て推奨
(define-key helm-swoop-map (kbd "C-r") 'helm-previous-line)
(define-key helm-swoop-map (kbd "C-s") 'helm-next-line)

;; ;; 検索結果をcycleしない、お好みで
;; (setq helm-swoop-move-to-line-cycle nil)

;; (cl-defun helm-swoop-nomigemo (&key $query ($multiline current-prefix-arg))
;;   "シンボル検索用Migemo無効版helm-swoop"
;;   (interactive)
;;   (let ((helm-swoop-pre-input-function
;;          (lambda () (format "\\_<%s\\_> " (thing-at-point 'symbol)))))
;;     (helm-swoop :$source (delete '(migemo) (copy-sequence (helm-c-source-swoop)))
;;                 :$query $query :$multiline $multiline)))
;; ;; C-M-:に割り当て
;; (global-set-key (kbd "C-M-:") 'helm-swoop-nomigemo)

;; ;; [2014-11-25 Tue]
;; (when (featurep 'helm-anything)
;;   (defadvice helm-resume (around helm-swoop-resume activate)
;;     "helm-anything-resumeで復元できないのでその場合に限定して無効化"
;;     ad-do-it))

;; ;; helm-swoopフォルダを任意の位置に置きます
;; (add-to-list 'load-path "~/.emacs.d/elisp/helm-swoop")

;; キーバインドはお好みで
(global-set-key (kbd "M-i") 'helm-swoop)
(global-set-key (kbd "M-I") 'helm-swoop-back-to-last-point)
(global-set-key (kbd "C-c M-i") 'helm-multi-swoop)
(global-set-key (kbd "C-x M-i") 'helm-multi-swoop-all)

;; ;; isearch実行中にhelm-swoopに移行
;; (define-key isearch-mode-map (kbd "M-i") 'helm-swoop-from-isearch)
;; ;; helm-swoop実行中にhelm-multi-swoop-allに移行
;; (define-key helm-swoop-map (kbd "M-i") 'helm-multi-swoop-all-from-helm-swoop)

;; ;; Save buffer when helm-multi-swoop-edit complete
;; (setq helm-multi-swoop-edit-save t)

;; ;; 値がtの場合はウィンドウ内に分割、nilなら別のウィンドウを使用
;; (setq helm-swoop-split-with-multiple-windows nil)

;; ;; ウィンドウ分割方向 'split-window-vertically or 'split-window-horizontally
;; (setq helm-swoop-split-direction 'split-window-vertically)

;; ;; nilなら一覧のテキストカラーを失う代わりに、起動スピードをほんの少し上げる
;; (setq helm-swoop-speed-or-color t)


;;----------------------------------------------------------------
;; helm/anything.el検索結果を次々と辿る方法
;; http://rubikitch.com/2014/11/27/helm-next-error/
;; 141127102557.helm-next-error.1.el
;; helm-occurの後でしか機能しない
;;;; replacement of `next-error' and `previous-error'

(require 'helm-anything nil t)
(require 'helm)

;;; resumable helm/anything buffers
(defvar helm-resume-goto-buffer-regexp
  (rx (or (regexp "Helm Swoop") "helm imenu" (regexp "helm.+grep") "helm-ag"
          "occur"
          "*anything grep" "anything current buffer")))
(defvar helm-resume-goto-function nil)
(defun helm-initialize--resume-goto (resume &rest _)
  (when (and (not (eq resume 'noresume))
             (ignore-errors
               (string-match helm-resume-goto-buffer-regexp helm-last-buffer)))
    (setq helm-resume-goto-function
          (list 'helm-resume helm-last-buffer))))
(advice-add 'helm-initialize :after 'helm-initialize--resume-goto)
(defun anything-initialize--resume-goto (resume &rest _)
  (when (and (not (eq resume 'noresume))
             (ignore-errors
               (string-match helm-resume-goto-buffer-regexp anything-last-buffer)))
    (setq helm-resume-goto-function
          (list 'anything-resume anything-last-buffer))))
(advice-add 'anything-initialize :after 'anything-initialize--resume-goto)

;;; next-error/previous-error
(defun compilation-start--resume-goto (&rest _)
  (setq helm-resume-goto-function 'next-error))
(advice-add 'compilation-start :after 'compilation-start--resume-goto)
(advice-add 'occur-mode :after 'compilation-start--resume-goto)
(advice-add 'occur-mode-goto-occurrence :after 'compilation-start--resume-goto)
(advice-add 'compile-goto-error :after 'compilation-start--resume-goto)


(defun helm-resume-and- (key)
  (unless (eq helm-resume-goto-function 'next-error)
    (if (fboundp 'helm-anything-resume)
        (setq helm-anything-resume-function helm-resume-goto-function)
      (setq helm-last-buffer (cadr helm-resume-goto-function)))
    (execute-kbd-macro
     (kbd (format "%s %s RET"
                  (key-description (car (where-is-internal
                                         (if (fboundp 'helm-anything-resume)
                                             'helm-anything-resume
                                           'helm-resume))))
                  key)))
    (message "Resuming %s" (cadr helm-resume-goto-function))
    t))
(defun helm-resume-and-previous ()
  "Relacement of `previous-error'"
  (interactive)
  (or (helm-resume-and- "C-p")
      (call-interactively 'previous-error)))
(defun helm-resume-and-next ()
  "Relacement of `next-error'"
  (interactive)
  (or (helm-resume-and- "C-n")
      (call-interactively 'next-error)))

;;; Replace: next-error / previous-error
(require 'helm-config)
(ignore-errors (helm-anything-set-keys))
(global-set-key (kbd "M-g M-n") 'helm-resume-and-next)
(global-set-key (kbd "M-g M-p") 'helm-resume-and-previous)



;; ;;----------------------------------------------------------------
;; ;; # helm-yasnippet
;; ;; http://d.hatena.ne.jp/syohex/20121207/1354885367
;; ;;
;; (defun my-yas/prompt (prompt choices &optional display-fn)
;;   (let* ((names (loop for choice in choices
;;                       collect (or (and display-fn (funcall display-fn choice))
;;                                   choice)))
;;          (selected (helm-other-buffer
;;                     `(((name . ,(format "%s" prompt))
;;                        (candidates . names)
;;                        (action . (("Insert snippet" . (lambda (arg) arg))))))
;;                     "*helm yas/prompt*")))
;;     (if selected
;;         (let ((n (position selected names :test 'equal)))
;;           (nth n choices))
;;       (signal 'quit "user quit!"))))
;; (custom-set-variables '(yas/prompt-functions '(my-yas/prompt)))


;;----------------------------------------------------------------
;; #helm-c-yasnippet
;;
(when (require 'yasnippet nil t)
  (when (require 'helm-c-yasnippet nil t)
    (setq helm-c-yas-space-match-any-greedy t) ;[default: nil]
    (global-set-key (kbd "C-x y") 'helm-c-yas-complete)
    )
  )



;;----------------------------------------------------------------
;; # helm-dired-recent-dirs
;; よく行くディレクトリに移動する
;; http://qiita.com/akisute3@github/items/ba0a90c1dd4298e99e30
;;
(require 'helm-dired-recent-dirs)
(global-set-key (kbd "C-c j") 'helm-dired-recent-dirs-view)


;;----------------------------------------------------------------
;; helmでカレントディレクトリのファイルを見やすく開く
;; http://d.hatena.ne.jp/syohex/20120718/1342621981
(require 'cl)
(require 'helm-config)
(require 'helm-files)

(defvar my/helm-c-current-directory-source
  `((name . "Current Directory Files")
    (candidates . (lambda ()
                    (with-helm-current-buffer
                      (let ((dirs (directory-files (helm-c-current-directory)))
                            (filter (lambda (d) (string-match "^\.\.?$" d))))
                        (remove-if filter dirs)))))
    (type . file)))

(defun my/helm-find-file-current-directory ()
  (interactive)
  (let ((curbuf (current-buffer))
        (orig-major major-mode))
    (if (helm-other-buffer 'my/helm-c-current-directory-source "*helm-dired*")
        (and (eq orig-major 'dired-mode) (kill-buffer curbuf)))))

(global-set-key (kbd "C-x C-p") 'my/helm-find-file-current-directory)


;;----------------------------------------------------------------
;; #ace-jump-mode
;; http://d.hatena.ne.jp/rkworks/20120520/1337528737
;;
(require 'ace-jump-mode)
(defun add-keys-to-ace-jump-mode (prefix c &optional mode)
  (define-key global-map
    (read-kbd-macro (concat prefix (string c)))
    `(lambda ()
       (interactive)
       (funcall (if (eq ',mode 'word)
                    #'ace-jump-word-mode
                  #'ace-jump-char-mode) ,c))))

(loop for c from ?0 to ?9 do (add-keys-to-ace-jump-mode "H-" c))
(loop for c from ?a to ?z do (add-keys-to-ace-jump-mode "H-" c))
(loop for c from ?! to ?~ do (add-keys-to-ace-jump-mode "H-" c))
(loop for c from ?0 to ?9 do (add-keys-to-ace-jump-mode "H-M-" c 'word))
(loop for c from ?a to ?z do (add-keys-to-ace-jump-mode "H-M-" c 'word))
(loop for c from ?! to ?~ do (add-keys-to-ace-jump-mode "H-M-" c 'word))


;;----------------------------------------------------------------
;; #ace-isearch
;;
(global-ace-isearch-mode 1)

;;----------------------------------------------------------------
;; helm-bm
;;

(require 'bm)
(defun bm-find-files-in-repository ()
  (interactive)
  (cl-loop for (key . _) in bm-repository
           when (file-exists-p key)
           do (find-file-noselect key)))
(defun bm-repository-load-and-open ()
  (interactive)
  (bm-repository-load)
  (bm-find-files-in-repository))

(setq bm-repository-file "~/.emacs.d/bm-repository")
(setq-default bm-buffer-persistence t)
(setq bm-restore-repository-on-load t)
(add-hook 'after-init-hook 'bm-repository-load-and-open)
(defun bm-buffer-restore-safe ()
  (ignore-errors (bm-buffer-restore)))
(add-hook 'find-file-hooks 'bm-buffer-restore-safe)
(add-hook 'kill-buffer-hook 'bm-buffer-save)
(defun bm-save-to-repository ()
  (interactive)
  (unless noninteractive
    (bm-buffer-save-all)
    (bm-repository-save)))
(add-hook 'kill-emacs-hook 'bm-save-to-repository)
(run-with-idle-timer 600 t 'bm-save-to-repository)
(add-hook 'after-revert-hook 'bm-buffer-restore)
(add-hook 'vc-before-checkin-hook 'bm-buffer-save)
(add-hook 'before-save-hook 'bm-buffer-save)

(require 'helm-bm)
;; migemoくらいつけようね
(push '(migemo) helm-source-bm)
;; annotationはあまり使わないので仕切り線で表示件数減るの嫌
(setq helm-source-bm (delete '(multiline) helm-source-bm))

(defun bm-toggle-or-helm ()
  "2回連続で起動したらhelm-bmを実行させる"
  (interactive)
  (bm-toggle)
  (when (eq last-command 'bm-toggle-or-helm)
    (helm-bm)))
(global-set-key (kbd "C-\\") 'bm-toggle-or-helm)
