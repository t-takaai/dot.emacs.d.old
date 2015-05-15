
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
