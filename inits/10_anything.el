

;;----------------------------------------------------------------
;; #anything
;;
;(require 'anything-config)

;(setq anything-sources (list anything-source-buffers
;                             anything-source-bookmarks
;                             ;;anything-source-recentf
;                             anything-source-file-name-history
;                             anything-source-locate-r
;                             anything-source-complex-command-history))
;(setq anything-type-actions (list anything-actions-buffer
;                                  anything-actions-file
;                                  anything-actions-sexp))

;(define-key anything-map "\C-p" 'anything-previous-line)
;(define-key anything-map "\C-n" 'anything-next-line)
;(define-key anything-map "\C-v" 'anything-next-page)
;(define-key anything-map "\M-v" 'anything-previous-page)


;; anything-filelist+
(require 'anything-startup)
(global-set-key (kbd "C-:") 'anything-filelist+)
;(setq anything-c-filelist-file-name "/tmp/mnt/all.filelist.takaai")
(setq anything-c-filelist-file-name "/tmp/all.filelist.takaai")
