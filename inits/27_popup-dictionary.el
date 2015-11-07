;; Mac の Emacs でツールチップ辞書を実現しよう。
;; http://d.hatena.ne.jp/tomoya/20091218/1261138091
;; http://kiririmode.hatenablog.jp/entry/20091228/p1
;; http://ameblo.jp/oyasai10/entry-11865683996.html

(defun ns-popup-dictionary ()
   "カーソル付近の単語を Mac の辞書でひく"
   (interactive)
   (let ((word (substring-no-properties (thing-at-point 'word)))
	 (old-buf (current-buffer))
	 (dict-buf (get-buffer-create "*dictionary.app*"))
	 (view-mode-p)
	 (dict))
     (set-buffer dict-buf)
     (erase-buffer)
     (call-process "/Users/takaai/bin/dict"
		   nil "*dictionary.app*" t word
		   "Japanese-English")
     (setq dict (buffer-string))
     (set-buffer old-buf)
     (when view-mode
       (view-mode)
       (setq view-mode-p t))
     (popup-tip dict)
     (when view-mode-p
       (view-mode))))

(define-key global-map (kbd "C-M-d") 'ns-popup-dictionary)
