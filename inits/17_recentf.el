
;;----------------------------------------------------------------
;; #recentf
;;
;; preserv recent 2000 files
(setq recentf-max-saved-items 2000)
;; exclueded regular expression
(setq recentf-exclude '("/TAGS$" "/var/tmp/"))
(require 'recentf-ext)
(global-set-key "\C-xp" 'recentf-open-files)

