
;;----------------------------------------------------------------
;; #org-mode
;;
(require 'org-install)
(setq org-startup-truncated nil)
(setq org-return-follows-link t)
(add-to-list 'auto-mode-alist '("\\.org$" . org-mode))
;; (org-remember-insinuate)
(setq org-directory "~/Dropbox/memo/")
(setq org-default-notes-file (concat org-directory "agenda.org"))
(setq org-capture-templates
      '(("t" "Todo" entry
         (file+headline nil "Inbox")
         "** TODO %?\n   %i\n   %a\n   %t")
        ("b" "Bug" entry
         (file+headline nil "Inbox")
         "** TODO %?   :bug:\n   %i\n   %a\n   %t")
        ("i" "Idea" entry
         (file+headline nil "New Ideas")
         "** %?\n   %i\n   %a\n   %t")))
 

;; ショートカットキー
(global-set-key "\C-cl" 'org-store-link)
(global-set-key "\C-co" 'org-capture)
(global-set-key "\C-ca" 'org-agenda)
(global-set-key "\C-cb" 'org-iswitchb)
(global-set-key "\C-cr" 'org-remember)
 
(setq org-agenda-files (list org-directory)) ;agendaを使うため
(setq org-src-fontify-natively t) ;コード用のモードと同じ色でハイライト表示
(add-hook 'org-mode-hook 'turn-on-font-lock) ; org-modeでの強調表示を可能にする
;(setq org-hide-leading-stars t) ; 見出しの余分な*を消す
(setq org-directory "~/Dropbox/org/") ; org-default-notes-fileのディレクトリ
(setq org-default-notes-file "notes.org") ; org-default-notes-fileのファイル名

;; org-modeで日本語PDFを出力する
;; http://fjyuu.info/blog/org-export-pdf/

;; (when (require 'org-install nil t)
;;   ;; LaTeX article class
;;   (setq org-export-latex-classes
;;         '(("article"
;;            "\\documentclass[11pt,a4paper]{jsarticle}
;; \\usepackage{amsmath}
;; \\usepackage{amsthm}
;; \\usepackage{bm}
;; \\usepackage[dvipdfmx,hiresbb]{graphicx}
;; \\usepackage[dvipdfmx]{color}"
;;            ("\\section{%s}" . "\\section*{%s}")
;;            ("\\subsection{%s}" . "\\subsection*{%s}")
;;            ("\\subsubsection{%s}" . "\\subsubsection*{%s}")
;;            ("\\paragraph{%s}" . "\\paragraph*{%s}")
;;            ("\\subparagraph{%s}" . "\\subparagraph*{%s}"))))

;;   ;; LaTeXからPDFを作成するコマンド
;;   (when (executable-find "platexpdf")
;;     (setq org-latex-to-pdf-process '("platexpdf %f" "platexpdf %f")))

;;   ;; PDFを開くコマンド
;;   (eval-after-load "org"
;;     '(progn
;;        (delete '("\\.pdf\\'" . default) org-file-apps)
;;        (add-to-list 'org-file-apps '("\\.pdf\\'" . "open %s")))))

;; Org-Modeで日本語を含むファイルをPDFにエクスポートする方法
;; http://d.hatena.ne.jp/mokimokisan/20120624/1340558857
;; (setq org-export-latex-coding-system 'utf-8)
;; (setq org-export-latex-date-format "%Y-%m-%d")
;; (setq org-export-latex-classes nil)
;; (add-to-list 'org-export-latex-classes
;;   '("jsarticle"
;;     "\\documentclass[a4j]{jsarticle}"
;;     ("\\section{%s}" . "\\section*{%s}")
;;     ("\\subsection{%s}" . "\\subsection*{%s}")
;;     ("\\subsubsection{%s}" . "\\subsubsection*{%s}")
;;     ("\\paragraph{%s}" . "\\paragraph*{%s}")
;;     ("\\subparagraph{%s}" . "\\subparagraph*{%s}")
;; ))
;; (setq org-export-latex-packages-alist
;;   '(("AUTO" "inputenc"  t)
;;     ("T1"   "fontenc"   t)
;;     ))

;; org-mode 8.0 画像入り日本語PDFをOSX10.8で出力するなら LuaTeX を使え！
;; http://blog.livedoor.jp/tek_nishi/archives/7862119.html
(setq org-latex-classes '(("ltjsarticle"
            "\\documentclass{ltjsarticle}
\\usepackage{graphicx}
\\usepackage{color}
\\usepackage{atbegshi}
\\usepackage[unicode=true,bookmarks=true]{hyperref}
\\usepackage{bookmark}
\\usepackage{url}
[NO-DEFAULT-PACKAGES]
[PACKAGES]
[EXTRA]"
            ("\\section{%s}" . "\\section*{%s}")
            ("\\subsection{%s}" . "\\subsection*{%s}")
            ("\\subsubsection{%s}" . "\\subsubsection*{%s}")
            ("\\paragraph{%s}" . "\\paragraph*{%s}")
            ("\\subparagraph{%s}" . "\\subparagraph*{%s}"))
               ))

(setq org-latex-default-class "ltjsarticle")
(setq org-latex-pdf-process '("lualatex %b" "lualatex %b"))

