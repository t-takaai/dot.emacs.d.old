(require 'calfw) ; 初回一度だけ
;(cfw:open-calendar-buffer) ; カレンダー表示



;;cfw:org-capture-templateはcalfw-orgを
;;requireする前に評価しておいてください。
(setq cfw:org-capture-template
      '("c" "calfw2org" entry 
        (file "~/Dropbox/gcal/gcal_private.org")
        "*  %?\n %(cfw:org-capture-day)"))

(require 'calfw-org)

(defun cfw:open-calendar ()
  (interactive)
  (let ((cp
         (cfw:create-calendar-component-buffer
          :view 'month
          :contents-sources
          (list 
           (cfw:org-create-file-source
            "MeBio" "~/Dropbox/gcal/gcal_mebio.org" "#268bd2")
           (cfw:org-create-file-source
            "Private" "~/Dropbox/gcal/gcal_private.org" "#859900")))))
    (switch-to-buffer (cfw:cp-get-buffer cp))))











