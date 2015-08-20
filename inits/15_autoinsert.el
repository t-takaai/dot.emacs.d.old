

;;----------------------------------------------------------------
;; #autoinsert
;;
(require 'autoinsert)

;; テンプレートのディレクトリ
(setq auto-insert-directory "~/.emacs.d/templates/")

;; 各ファイルによってテンプレートを切り替える
(setq auto-insert-alist
      (nconc '(
               ("\\.cpp$" . ["template.cpp" my-template])
               ("\\.h$"   . ["template.h" my-template])
	       ("\\.mdf$"   . ["template.mdf" my-template])
	       ("\\.tex$"   . ["template.tex" my-template])
	       ("\\.html$"   . ["template.html" my-template])
	       ("\\.php$"   . ["template.php" my-template])
               ) auto-insert-alist))
(add-hook 'find-file-hooks 'auto-insert)
(require 'cl)

;; ここが腕の見せ所
(defvar template-replacements-alists
  '(("%file%"             . (lambda () (file-name-nondirectory (buffer-file-name))))
    ("%file-without-ext%" . (lambda () (file-name-sans-extension (file-name-nondirectory (buffer-file-name)))))
    ("%date%"             . (lambda () (concat (format-time-string "%Y/%m/%d (%a) %H:%M:%S") " JST by Takayuki Takaai")))
    ("%include-guard%"    . (lambda () (format "__SCHEME_%s__" (upcase (file-name-sans-extension (file-name-nondirectory buffer-file-name))))))))

(defun my-template ()
  (time-stamp)
  (mapc #'(lambda(c)
        (progn
          (goto-char (point-min))
          (replace-string (car c) (funcall (cdr c)) nil)))
    template-replacements-alists)
  (goto-char (point-max))
  (message "done."))
(add-hook 'find-file-not-found-hooks 'auto-insert)



;; 最終更新日の自動挿入
;; http://qiita.com/osada/items/3f2e586d120e0d6d778c
(require 'time-stamp)

;; 日本語で日付を入れたくないのでlocaleをCにする
(defun time-stamp-with-locale-c ()
  (let ((system-time-locale "C"))
    (time-stamp)
    nil))

;; time-stampの実行よりも前に定義しておく必要がある。
(if (not (memq 'time-stamp-with-locale-c write-file-hooks)) ;; 21.4 以降
    (add-hook 'write-file-hooks 'time-stamp-with-locale-c))  ;; 21.4
;; (if (not (memq 'time-stamp-with-locale-c write-file-hooks))    ;; 21.3 以前
;;     (setq write-file-hooks
;;           (cons 'time-stamp-with-locale-c write-file-hooks)))  ;; 21.3

(add-hook 'before-save-hook 'time-stamp)      ;; Emacs 21.4 以降
;; (if (not (memq 'time-stamp write-file-hooks))   ;; Emacs 21.3 以前
;;     (setq write-file-hooks                      ;; 21.3
;;           (cons 'time-stamp write-file-hooks))) ;; 21.3

(setq time-stamp-active t)
(setq time-stamp-start "[Ll]ast[ \-][Uu]pdated : ")
(setq time-stamp-format "%04y/%02m/%02d (%3a) %02H:%02M:%02S %Z by %U")
;(setq time-stamp-end ">")         ;; End of file
(setq time-stamp-end "$")   ;; Space or End of line
(setq time-stamp-line-limit 10)   ;; ファイルの先頭から10行以内を探す
;(setq time-stamp-line-limit -4) ;; ファイルの後ろから 4行以内を検索



;; (require 'time-stamp)
;; (add-hook 'before-save-hook 'time-stamp)
;; (setq time-stamp-active t)
;; (setq time-stamp-start "[lL]ast[ -][uU]pdated[ \t]*:[ \t]*<")
;; (setq time-stamp-format "%:y/%02m/%02d %02H:%02M:%02S from %s by %u")
;; (setq time-stamp-end ">")
;; (setq time-stamp-line-limit 20)

;; (if (not (memq 'time-stamp write-file-hooks))
;; (setq write-file-hooks
;; (cons 'time-stamp write-file-hooks)))

;; ;; 1) icalender.elの読み込み
;; (setq load-path (append (list (expand-file-name "~/.emacs.d/icalendar")) load-path))
;; (require 'icalendar)
;; ;----
;; ;; 2-1) google calender関連elispの読み込み
;; (setq load-path (append load-path (list (expand-file-name "~/.emacs.d/google"))))
;; (require 'google-calendar)
;; ;----
;; ;; 2-2) google calendarの設定
;; (setq google-calendar-user           "takoyaj")         ;;; GOOGLE USER
;; (setq google-calendar-code-directory "~/.emacs.d/google/code") ;;; PATH TO THEPYTHON CODE
;; (setq google-calendar-directory      "~/tmp")               ;;; TEMPORARY DIRECTORY
;; (setq google-calendar-url            "https://www.google.com/calendar/ical/uvl7n88702evof7jeu0fs3scv8%40group.calendar.google.com/public/basic.ics")  ;;; URL TO YOUR GOOGLE CALENDAR
;; (setq google-calendar-auto-update    t )                    ;;; DEFINE IF THE CALENDAR IS DOWNLOADED AFTER EVERY MODIFICATION

