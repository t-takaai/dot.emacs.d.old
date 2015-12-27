
;;----------------------------------------------------------------
;; #YaTeX
;;

(autoload 'yatex-mode "yatex" "Yet Another LaTeX mode" t)
(setq auto-mode-alist
      (append
       '(
         ("\\.tex$" . yatex-mode)
         ("\\.ltx$" . yatex-mode)
         ("\\.cls$" . yatex-mode)
         ("\\.sty$" . yatex-mode)
         ("\\.clo$" . yatex-mode)
         ("\\.bbl$" . yatex-mode)
         ("\\.mdf$" . yatex-mode)
         ) auto-mode-alist))
;(setq YaTeX-inhibit-prefix-letter t)
(setq YaTeX-kanji-code nil)
;(setq tex-command "/usr/texbin/platex -synctex=1")
(setq bibtex-command "pbibtex")
(setq makeindex-command "mendex")
;(setq dvi2-command "/usr/texbin/xdvi")
;(setq dvi2-command "/usr/local/Cellar/skim/HEAD/Skim.app/Contents/MacOS/Skim")
(setq dvi2-command "~/bin/dviskim.sh")
;(setq dvi2-command "open -a Skim")
;(setq tex-command "~/Library/TeXShop/bin/platex2pdf-euc"
;      dvi2-command "open -a TeXShop")
(setq dviprint-command-format "dvipdfmx %s")
(setq YaTeX-inhibit-prefix-letter t)

;; (add-hook 'yatex-mode-hook
;;           '(lambda () (define-key YaTeX-mode-map (kbd "'") 'YaTeX-math-insert-sequence)))

;; AMS-LaTeX を使って数式を書くとき，何も設定しないと YaTeX は数式環境だと 認識してくれません。ということは，例えば align 環境の中で ";" を押しても 数式補完モードにはなってくれません。これではせっかくの AMS-LaTeX も YaTeX も台無しなので
;;(setq YaTeX-use-AMS-LaTeX t)

;; 「"」のキーで `` や '' を出さない
;; YaTeX Mode に入ってから、M-x local-unset-key RET " RET または
(add-hook 'yatex-mode-hook
          '(lambda ()
             (local-unset-key "\"")
             ;; 代わりにF5 に振り付ける
             (define-key YaTeX-mode-map [f5] 'YaTeX-insert-quote)
             ;; auto-fill-mode をオフにする（改行時のエラーに対処）
             (auto-fill-mode -1)
             ))

(setq YaTeX-math-key-list
      '(("'" . YaTeX-math-sign-alist)
        (":" . YaTeX-greek-key-alist)
        ))

;; 以下うまく機能せず
;; (setq YaTeX-math-key-list-private
;;       '(("\"" . YaTeX-math-funcs-list)
;; 	))
;; (setq YaTeX-math-funcs-list
;;       '(("s"	"sin"           "sin")
;; 	("c"    "cos"           "cos") 
;; 	("t"    "tan"           "tan")
;; 	("hs"	"sinh"          "sinh")
;; 	("hc"   "cosh"          "cosh")
;; 	("ht"   "tanh"          "tanh")
;; 	("S"	"arcsin"        "arcsin")
;; 	("C"    "arccos"        "arccos")
;; 	("T"    "arctan"        "arctan")
;; 	("se"   "sec"           "sec")
;; 	("cs"   "csc"           "csc")
;; 	("cot"  "cot"           "cot")
;; 	("l"    "ln"            "ln")
;; 	("L"    "log"           "log")
;; 	("e"    "exp"           "exp")
;; 	("M"    "max"           "max")
;; 	("m"    "min"           "min")
;; 	("su"   "sup"           "sup")
;; 	("in"   "inf"           "inf")
;; 	("di"   "dim"           "dim")
;; 	("de"   "det"           "det")
;; 	("i"    "imath"         "i")
;; 	("j"    "jmath"         "j")
;; 	("I"    "Im"            "Im")
;; 	("R"    "Re"            "Re")
;; 	))

;; math-sign の追加
(setq
 YaTeX-math-sign-alist-private
 '(
   ("q"         "quad"          "__")
   ("qq"        "qquad"        "____")
   ("t"		"text"		"text")
   ("ls"        "varlimsup"     "___\nlim")
   ("li"        "varliminf"     "lim\n---")
   ("il"        "varinjlim"     "lim\n-->")
   ("pl"        "varprojlim"    "lim\n<--")
   ("st"        "text{ s.t. }" "s.t.")
   ("bigop"     "bigoplus"      "_\n(+)~")
   ("bigot"     "bigotimes"     "_\n(x)\n ~")
   ))
;; プレビュー時、拡張子の補完をやめる
(setq YaTeX-dvi2-command-ext-alist nil)

;; latexmk
;(setq tex-command "latexmk -pv -pdf")
;(setq tex-command "TEXINPUTS=.:/Users/takaai/mebio/Data//:/Users/takaai/mebio/MyData//:/Users/takaai/mebio/Chokuzen//: latexmk -pvc")
(setq tex-command "latexmk -pvc")


;;----------------------------------------------------------------
;; mdf
;;

;; (defun mdf-test ()
;;   (interactive)
;;   (save-buffer)
;;   (shell-command (concat "mdftest " (buffer-file-name)))
;;   )

;; (add-hook 
;;   'yatex-mode-hook
;;   '(lambda() 
;;      (require 'yatexprc)
;;      (local-set-key (kbd "C-'") 'mdf-test)))

(defun shell-command-sequence (cmd &rest others)
  (mapc 'shell-command `(,cmd ,@others)))

;; mdfファイルのコンパイル

;; 以下のスクリプトを"mdftest"という名前でPATHの通ったディレクトリに置く

;;----------------------------------------------------------------

;; #! /bin/zsh
;; name_ext=$1
;; name="${name_ext%.*}"
;; echo '\\documentclass[11pt]{jreport}
;; \\usepackage[T1]{fontenc}
;; \\usepackage{lmodern}
;; \\usepackage[deluxe]{otf}
;; %\\usepackage[dvipdfmx]{graphicx}			%	pdf にする場合
;; %\\usepackage[dvipdfmx,dvipsnames]{xcolor}	%	pdf にする場合
;; \\usepackage[dvipdfmx]{color,graphicx}
;; \\usepackage{amsmath}
;; \\usepackage{mebiolabo20140801}
;; %\\usepackage{mebio}

;; \\用紙サイズ{A4}
;; \\印刷形式{ts}

;; \\begin{document}
;; \\everymath{\displaystyle}

;; \\showmdftitle
;; \\showmdfref

;; \\mdfinput[testmondai]{'$1'}

;; \\end{document}' > $name.tex

;; # platex tmp.tex
;; # open tmp.dvi

;; latexmk -pvc $name.tex &

;;----------------------------------------------------------------



(defun mdf-typeset-and-preview ()
  (interactive)
  (let* ((f (buffer-file-name))
         (dir (file-name-directory f))
         (stem (file-name-sans-extension f)))
    (save-excursion
      (basic-save-buffer)
      (shell-command-sequence (concat "cd " dir)
                              (concat "mdftest " f)
;                              (concat "dvipdfmx " stem ".dvi")
;                              (concat "rm " stem ".dvi")
;                              (concat "rm " stem ".aux") ;; ここはコメントアウトすべきかも
;                              (concat "rm " stem ".log")
			      )
;      (pop-to-buffer (find-file-noselect (concat stem ".pdf")))
      )))


;; (defun mdf-typeset-and-preview-region (beg end)
;;   (interactive "r")
;;   (let* ((f (file-name-nondirectory (buffer-file-name)))
;;          (tmpfile (concat "/tmp/" f))
;;          (stem (file-name-sans-extension tmpfile))
;;          (contents (buffer-substring-no-properties beg end))
;;          header)
;;     (save-excursion
;;       (goto-char (point-min))
;;       (re-search-forward "\\\\begin{document}")
;;       (setq header (buffer-substring-no-properties (point-min) (1+ (match-end 0))))
;;       (set-buffer (find-file-noselect tmpfile))
;;       (insert header)
;;       (insert contents)
;;       (insert "\\end{document}")
;;       (unwind-protect
;;           (yatex-typeset-and-preview)
;;         (shell-command (concat "rm " tmpfile))
;;         (kill-buffer (current-buffer))))))

;; カーソル行でmdfがincludeされているときに実行するとそのmdfファイルを開く
(require 'mb-find-mdffile-at-cursor)

(add-hook 'yatex-mode-hook
          (lambda ()
            (local-set-key (kbd "C-c C-c") 'mdf-typeset-and-preview)
            (local-set-key (kbd "M-=") "$")
            (local-set-key (kbd "C-c C-f") 'mb-find-mdffile-at-cursor)
;            (local-set-key (kbd "C-c C-r") 'mdf-typeset-and-preview-region)
	    ))

;; (defvar mdf-mode-map nil)

;; (if mdf-mode-map
;;     ()
;;   (setq mdf-mode-map (make-sparse-keymap))
;;   (define-key mdf-mode-map (kbd "C-'") 'mdf-test))

;; (defvar mdf-mode nil)

;; (if (not (assq 'mdf-mode minor-mode-alist))
;;     (setq minor-mode-alist
;;              (cons '(mdf-mode " mdf-mode")
;; 		   minor-mode-alist)))

;; (defun mdf-mode (&optional arg)
;;            "mdf minor-mode"
;; 	   (interactive)
;; 	   ;mode variable settings
;; 	   (cond
;; 	    ((< (prefix-numeric-value arg) 0) ; 引数が1未満の数値なら起動しない
;; 	     (setq mdf-mode nil))
;; 	    (arg ; 何かしらの引数をもつならば起動
;; 	     (setq mdf-mode t))
;; 	    (t ; symbol t を引数にもつならばモードを逆転。
;; 	     (setq mdf-mode (not mdf-mode))))
;;             ;; content
;; 	   (if mdf-mode ; モードが起動されているならば実行
;; 	       (progn
;; 		 (setq tex-command "mdftest")
;; 		 (use-local-map mdf-mode-map)
;; 		 )
;; 	     nil))


;; (add-hook 'yatex-mode-hook
;; 	  '(lambda ()
;; 	     (cond
;; 	      ((string= (file-name-extension (buffer-file-name)) "mdf") (mdf-mode))
;; 	      (t (mdf-mode nil)))
;;            ))

;; (add-hook 'yatex-mode-hook
;; 	  '(lambda ()
;; 	     (cond
;; 	      ((string= (file-name-extension (buffer-file-name)) "mdf") (mdf-mode))
;; 	      (t (mdf-mode nil)))
;;            ))

  

;;----------------------------------------------------------------
;; #skim
;;
;; http://oku.edu.mie-u.ac.jp/~okumura/texwiki/?Emacs#de8b4fcd
;; inverse search
(require 'server)
(unless (server-running-p) (server-start))
 
;; forward search
;; Http://oku.edu.mie-u.ac.jp/~okumura/texwiki/?YaTeX#f978a43b
(defun skim-forward-search ()
  (interactive)
  (progn
    (process-kill-without-query
     (start-process  
      "displayline"
      nil
      "/Applications/Skim.app/Contents/SharedSupport/displayline"
      (number-to-string (save-restriction
                          (widen)
                          (count-lines (point-min) (point))))
      (expand-file-name
       (concat (file-name-sans-extension (or YaTeX-parent-file
                                             (save-excursion
                                               (YaTeX-visit-main t)
                                               buffer-file-name)))
               ".pdf"))
      buffer-file-name))))
 
(add-hook 'yatex-mode-hook
          '(lambda ()
             (define-key YaTeX-mode-map (kbd "C-c s") 'skim-forward-search)))


;;----------------------------------------------------------------
;; #latex-math-preview
;; http://transitive.info/software/latex-math-preview/
;;
(add-hook 'yatex-mode-hook
         '(lambda ()
         (YaTeX-define-key "\C-v" 'latex-math-preview-expression) ;数式、選択領域のプレビュ
         ;; (YaTeX-define-key "\C-p" 'latex-math-preview-save-image-file) ;数式、選択領域から画像を作成して保存
         ;; (YaTeX-define-key "j" 'latex-math-preview-insert-symbol) ;記号の一覧、挿入
         ;; (YaTeX-define-key "\C-j" 'latex-math-preview-last-symbol-again) ;直前の記号の再挿入
         ;; (YaTeX-define-key "\C-b" 'latex-math-preview-beamer-frame);beamer の frame のプレビュ
         ))
(setq latex-math-preview-in-math-mode-p-func 'YaTeX-in-math-mode-p)

(setq latex-math-preview-tex-to-png-for-preview '(platex dvipng))
(setq latex-math-preview-tex-to-png-for-save '(platex dvipng))
(setq latex-math-preview-tex-to-eps-for-save '(platex dvips-to-eps))
(setq latex-math-preview-tex-to-ps-for-save '(platex dvips-to-ps))
(setq latex-math-preview-beamer-to-png '(platex dvipdfmx gs-to-png))

(defvar latex-math-preview-latex-template-header
  "\\documentclass{jreport}\n\\pagestyle{empty}\n"
  "Insert string to beginning of temporary latex file to make image.")


