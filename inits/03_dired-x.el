
;;----------------------------------------------------------------
;; #dired-x
;;
(load "dired-x")
(add-hook 'dired-load-hook (lambda () (load "dired-x")))
;(add-hook 'dired-load-hook
;          (lambda ()
;            (load "dired-x")
;            (global-set-key "\C-x\C-j" 'skk-mode)
;            ))
(setq dired-guess-shell-alist-user
      '(("\\.png" "qlmanage -p")
	("\\.PNG" "qlmanage -p")
	("\\.mts" "qlmanage -p")
	("\\.MTS" "qlmanage -p")
        ("\\.jpg" "qlmanage -p")
        ("\\.JPG" "qlmanage -p")
        ("\\.pdf" "qlmanage -p")
        ("\\.PDF" "qlmanage -p")
        ("\\.dvi" "qlmanage -p")
;	("\\.dvi" "open")
	))

(eval-after-load "dired"
 '(progn
    (setq ls-lisp-dirs-first t)
    (setq dired-recursive-copies 'always)
    (setq dired-recursive-deletes 'always)
;    (put 'dired-find-alternate-file 'disabled nil);新規バッファを作成しない
    ))

;これを設定しておくと、ウィンドウを分割して左右にdiredバッファを開いているとき、
;RやCのデフォルトの宛先がもう片方のディレクトリになります．
(setq dired-dwim-target t)

;(define-key dired-mode-map " " 'dired-do-shell-command)

;; http://kouzuka.blogspot.jp/2011/02/emacs-dired-quick-look.html
;; (defun my-quicklook-at-point ()
;;   "Preview a file at point with Quick Look."
;;   (interactive)
;;   (require 'ffap)
;;   (let ((url (ffap-url-at-point))
;;         (file (ffap-file-at-point))
;;         (process (get-process "qlmanage_ps")))
;;     (when url
;;       (if (string-match "\\`file://\\(.*\\)\\'" url)
;;           (setq file (match-string 1 url))
;;         (setq file nil)))
;;     (when (or (not (stringp file))
;;               (not (file-exists-p (setq file (expand-file-name file)))))
;;       (when process
;;         (kill-process process))
;;       (error "No file found"))
;;     (if process
;;         (kill-process process)
;;       (message "Quick Look: %s" file)
;;       (start-process "qlmanage_ps" nil "qlmanage" "-p" file))))

;; (global-set-key "\C-cy" 'my-quicklook-at-point)

(defun my-dired-do-quicklook ()
  "In dired, preview with Quick Look."
  (interactive)
  (let ((file (dired-get-filename))
        (process (get-process "qlmanage_ps")))
    (if process
        (kill-process process)
      (start-process "qlmanage_ps" nil "qlmanage" "-p" file))))

(eval-after-load "dired"
  '(define-key dired-mode-map " " 'my-dired-do-quicklook))
