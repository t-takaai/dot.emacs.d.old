
;; obsolete
;; ;;----------------------------------------------------------------
;; ;; #iswitchb
;; ;;
;; (iswitchb-mode 1)
;; (add-hook 'iswitchb-define-mode-map-hook
;;           'iswitchb-my-keys)
;; ;; 私はさらに，下のような設定を入れてキーバインドを変更しています．こうしておくと， 左右のカーソルキーやSPC でもバッファを切り替えることができます．
;; (defun iswitchb-my-keys ()
;;   "Add my keybindings for iswitchb."
;;   (define-key iswitchb-mode-map [right] 'iswitchb-next-match)
;;   (define-key iswitchb-mode-map [left] 'iswitchb-prev-match)
;;   (define-key iswitchb-mode-map "\C-f" 'iswitchb-next-match)
;;   (define-key iswitchb-mode-map " " 'iswitchb-next-match)
;;   (define-key iswitchb-mode-map "\C-b" 'iswitchb-prev-match)
;;   )
;; ;; 私はさらに，以下のようにして一部の関数を変更しました．これで， iswitchb に候補が なければ find-file になります．さらに，C-u C-x b で通常の C-x b と同 じ動作になります．
;; (defun iswitchb-possible-new-buffer (buf)
;;   "Possibly create and visit a new buffer called BUF."
;;   (interactive)
;;   (message (format
;;             "No buffer matching `%s', "
;;             buf))
;;   (sit-for 1)
;;   (call-interactively 'find-file buf))

;; (defun iswitchb-buffer (arg)
;;   "Switch to another buffer.

;; The buffer name is selected interactively by typing a substring.  The
;; buffer is displayed according to `iswitchb-default-method' -- the
;; default is to show it in the same window, unless it is already visible
;; in another frame.
;; For details of keybindings, do `\\[describe-function] iswitchb'."
;;   (interactive "P")
;;   (if arg
;;       (call-interactively 'switch-to-buffer)
;;     (setq iswitchb-method iswitchb-default-method)
;;     (iswitchb)))
;; ;;バッファ選択時にウィンドウに選択中のバッファの内容を表示させる設定
;; (defadvice iswitchb-exhibit
;;   (after
;;    iswitchb-exhibit-with-display-buffer
;;    activate)
;;   "選択している buffer を window に表示してみる。"
;;   (when (and
;;          (eq iswitchb-method iswitchb-default-method)
;;          iswitchb-matches)
;;     (select-window
;;      (get-buffer-window (cadr (buffer-list))))
;;     (let ((iswitchb-method 'samewindow))
;;       (iswitchb-visit-buffer
;;        (get-buffer (car iswitchb-matches))))
;;     (select-window (minibuffer-window))))
